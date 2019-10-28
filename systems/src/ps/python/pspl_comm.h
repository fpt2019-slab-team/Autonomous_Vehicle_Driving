#ifndef PSPL_COMM
#define PSPL_COMM

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

#define PS_PL_ADDR       0x0000
#define PS_PL_VALUE      0x0001
#define PL_PS_ADDR       0x0002
#define PL_PS_VALUE      0x0003
#define PS_PL_LED        0x0000
#define PS_PL_R_ADDR     0x0005
#define PS_PL_SCCB_REQ   0x0007
#define PS_PL_SCCB_WR    0x0008
#define PS_PL_SCCB_WDATA 0x0009
#define PL_PS_R_DATA     0x0001
#define PL_PS_SCCB_RDATA 0x0003
#define PL_PS_SCCB_BUSY  0x0004

uint32_t *map_addr;
uint8_t readReg(const uint16_t sub_address);
void writeReg(const uint16_t sub_address, const uint8_t write_data);
void sendReg(const uint16_t sub_address, const uint8_t data);

#endif
