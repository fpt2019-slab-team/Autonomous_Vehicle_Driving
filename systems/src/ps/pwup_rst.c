#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define MSG_SIZE         256
#define PROCEDURE        14
#define PS_PL_ADDR       0x0000
#define PS_PL_VALUE      0x0001
#define PL_PS_ADDR       0x0002
#define PL_PS_VALUE      0x0003
#define PS_PL_SCCB_REQ   0x0007
#define PS_PL_SCCB_WR    0x0008
#define PS_PL_SCCB_WDATA 0x0009
#define PL_PS_SCCB_RDATA 0x0003
#define PL_PS_SCCB_BUSY  0x0004

uint8_t readReg(const uint16_t sub_address);
void writeReg(const uint16_t sub_address, const uint8_t write_data);
void sendReg(const uint16_t sub_address, const uint8_t data);

uint32_t *map_addr;
char msg[PROCEDURE][MSG_SIZE] = {
  " 1. Execute a power-cycle by applying a low pulse of 100ms on CAM_PWUP, then driving it high.",
  " 2. Wait for 50ms.", 
  " 3. Read sensor ID from registers 0x300A and 0x300B and check against 0x56 and 0x40, respectively.", 
  " 4. Choose system input clock from pad by writing 0x11 to register address 0x3103.", 
  " 5. Execute software reset by writing 0x82 to register address 0x3008.", 
  " 6. Wait for 10ms.", 
  " 7. De-assert reset and enable power down until configuration is done by writing 0x42 to register address 0x3008.", 
  " 8. Choose system input clock from PLL by writing 0x03 to register address 0x3103.", 
  " 9. Set PLL registers for desired MIPI data rate and sensor timing (frame rate).", 
  "10. Set imaging configuration registers.", 
  "11. Enable MIPI interface by writing either 0x45 for two-lane mode or 0x25 for one-lane mode to register address 0x300E.", 
  "12. Let MIPI clock free-run, and force LP11 when no packet transmission by writing 0x14 to register address 0x4800.", 
  "13. Set output format to RAW10 by writing 0x00 to register address 0x4300 and 0x03 to register address 0x501F.", 
  "14. Wake up sensor by writing 0x02 to register address 0x3800."
};

int main(void)
{
  int uiofd;
  int seq = 0; // sequence number (0 ~ 13)
  
  uiofd = open("/dev/uio0", O_RDWR);
  if (uiofd < 0) {
    printf("uio open failed. \n");
    return 1;
  }

  map_addr = (uint32_t *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, uiofd, 0);
  if (!map_addr) {
    printf("mmap failed. \n");
    return 1;
  }

  printf("> Start Power-up and Reset. \n");
  printf(" %s ... ", msg[seq++]); // 1
  printf("[done] \n");            
  printf(" %s ... ", msg[seq++]); // 2
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 3
  printf("[done] \n");
  while (readReg(0x300A) != 0x56 || readReg(0x300B) != 0x40);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 4
  sendReg(0x3103, 0x03);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 5
  sendReg(0x3008, 0x82);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 6
  usleep(10000);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 7
  sendReg(0x3008, 0x42);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 8
  sendReg(0x3103, 0x03);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 9
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 10
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 11
  sendReg(0x300E, 0x45); // 0x45 or 0x25
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 12
  sendReg(0x4800, 0x14);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 13
  sendReg(0x4300, 0x00);
  sendReg(0x501F, 0x03);
  printf("[done] \n");
  printf(" %s ... ", msg[seq++]); // 13
  sendReg(0x3800, 0x02);
  printf("[done] \n");  
  printf("> Complete Power-up and Reset. \n");
  
  close(uiofd);
  return 0;
}

uint8_t readReg(const uint16_t sub_address)
{
  const uint8_t id_address = 0x79; // ID Address of OV5640 for READ
  const uint32_t send_data = (id_address << 24) | (sub_address << 8) | 0x0;
  uint8_t read_data;

  // send read signal to sccb_if
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_WR;
  map_addr[PS_PL_VALUE] = 1; // read
    
  // set SCCB data to sccb_if module
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_WDATA;
  map_addr[PS_PL_VALUE] = send_data;

  // wait if sccb_if module is busy
  map_addr[PL_PS_ADDR] = PL_PS_SCCB_BUSY;
  while (map_addr[PL_PS_VALUE] != 0);

  // send SCCB data to sccb_if module
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_REQ;
  map_addr[PS_PL_VALUE] = 1;

  // wait if sccb_if module is busy
  map_addr[PL_PS_ADDR] = PL_PS_SCCB_BUSY;
  while (map_addr[PL_PS_VALUE] != 0);

  usleep(300);

  // get read data
  map_addr[PL_PS_ADDR] = PL_PS_SCCB_RDATA;
  read_data = map_addr[PL_PS_VALUE];

  // set reqest 0
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_REQ;
  map_addr[PS_PL_VALUE] = 0;

  return read_data;
}

void writeReg(const uint16_t sub_address, const uint8_t write_data)
{
  const uint8_t id_address = 0x78; // ID Address of OV5640 for WRITE
  const uint32_t send_data = (id_address << 24) | (sub_address << 8) | write_data;

  // send read signal to sccb_if
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_WR;
  map_addr[PS_PL_VALUE] = 0; // write

  // set SCCB data to sccb_if module
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_WDATA;
  map_addr[PS_PL_VALUE] = send_data;

  // wait if sccb_if module is busy
  map_addr[PL_PS_ADDR] = PL_PS_SCCB_BUSY;
  while (map_addr[PL_PS_VALUE] != 0);

  // send SCCB data to sccb_if module
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_REQ;
  map_addr[PS_PL_VALUE] = 1;

  usleep(10);
  
  // set reqest 0
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_REQ;
  map_addr[PS_PL_VALUE] = 0;

}

void sendReg(const uint16_t sub_address, const uint8_t data) {
  while (data != readReg(sub_address)) {
    writeReg(sub_address, data);
    usleep(300);
  }
}
