#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(void)
{
  int uiofd;
  unsigned int* map_addr; // slave register
  unsigned int addr; // register address
  unsigned int value; // register value

  uiofd = open("/dev/uio0", O_RDWR);
  if (uiofd < 0) {
    perror("uio open:");
    return 1;
  }

  map_addr = (unsigned int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, uiofd, 0);
  if (!map_addr) {
    fprintf(stderr, "mmap failed\n");
    return 1;
  }
    
  while (1) {
    printf("Register Values \n");
    printf("map_addr[0] => 0x%08x \n", map_addr[0]);
    printf("map_addr[1] => 0x%08x \n", map_addr[1]);
    printf("map_addr[2] => 0x%08x \n", map_addr[2]);
    printf("map_addr[3] => 0x%08x \n", map_addr[3]);

    // input register (slv_reg) address
    printf("addr = ");
    scanf("%u", &addr);

    if (addr >= 4) {
      break;
    }

    // input register value (32-bit)
    printf("value = ");
    scanf("%u", &value);

    map_addr[addr] = value;
  }

  close(uiofd);
  
  return 0;
}
