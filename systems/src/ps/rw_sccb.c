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

#define BUF_SIZE         64
#define PS_PL_ADDR       0x0000
#define PS_PL_VALUE      0x0001
#define PL_PS_ADDR       0x0002
#define PL_PS_VALUE      0x0003
#define PS_PL_SCCB_REQ   0x0007
#define PS_PL_SCCB_WR    0x0008
#define PS_PL_SCCB_WDATA 0x0009
#define PL_PS_SCCB_RDATA 0x0003
#define PL_PS_SCCB_BUSY  0x0004

void writeReg(const uint16_t sub_address, const uint32_t write_data);
uint8_t readReg(const uint16_t sub_address);

uint32_t *map_addr;

int main(void)
{
  int uiofd;
  char buf[BUF_SIZE];
  char opt[BUF_SIZE]; // option (write, read or quit)
  uint16_t sub_address;
  uint8_t read_data, write_data;

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

  while (1) {
    printf("> Select read (r) or write (w), 'q' to quit: ");
    fgets(opt, BUF_SIZE, stdin);

    if (strncmp(opt, "r", 1) == 0) {
      // input sub_address
      printf("> Sub-address (4 Bytes): 0x");
      fgets(buf, BUF_SIZE, stdin);

      // convert string to hexadecimal
      sub_address = strtol(buf, NULL, 16);

      // send SCCB data to register
      read_data = readReg(sub_address);
      printf("Sub-address: 0x%04x, Read Data: 0x%02x \n\n", sub_address, read_data);
    } else if (strncmp(opt, "w", 1) == 0) {
      // input sub_address
      printf("> Sub-address (4 Bytes): 0x");
      fgets(buf, BUF_SIZE, stdin);

      // convert string to hexadecimal
      sub_address = strtol(buf, NULL, 16);

      // input write_data
      printf("> Write Data (2 Bytes): 0x");
      fgets(buf, BUF_SIZE, stdin);

      // convert string to hexadecimal
      write_data = strtol(buf, NULL, 16);

      // send SCCB data to register
      writeReg(sub_address, write_data);

      printf("Sub-address: 0x%04x, Write Data: 0x%02x \n\n", sub_address, write_data);
    } else if (strncmp(opt, "q", 1) == 0) {
      break;
    }
  }

  close(uiofd);
  return 0;
}

void writeReg(const uint16_t sub_address, const uint32_t write_data)
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

  usleep(5);
  
  // set reqest 0
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_REQ;
  map_addr[PS_PL_VALUE] = 0;
}

uint8_t readReg(const uint16_t sub_address)
{
  const uint8_t id_address = 0x79; // ID Address of OV5640 for READ
  const uint32_t send_data = (id_address << 24) | (sub_address << 8) | 0x0;
  uint8_t read_data;

  // send read signal to sccb_if
  map_addr[PS_PL_ADDR] = PS_PL_SCCB_WR;
  map_addr[PS_PL_VALUE] = 1; // read
    
  // set SCCB data to PL
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
