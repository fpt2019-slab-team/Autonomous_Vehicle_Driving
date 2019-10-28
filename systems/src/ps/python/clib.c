#include "pspl_comm.h"

#define IMG_WIDTH  640
#define IMG_HEIGHT 480
#define IMG_PIXELS IMG_WIDTH * IMG_HEIGHT

int uiofd;

int check_open_uio(void)
{
  if (uiofd < 0) {
    perror("uio open:");
    return 1;
  }
  return 0;
}

int open_uio(void)
{
  uiofd = open("/dev/uio0", O_RDWR);
  if (check_open_uio() != 0) {
    return 1;
  }
  return 0;
}

int mapping_device(void)
{
  map_addr = (uint32_t *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, uiofd, 0);
  if (!map_addr) {
    fprintf(stderr, "mmap failed\n");
    return 1;
  }
  return 0;  
}

void close_uio(void)
{
  close(uiofd);
}

void led(uint32_t num)
{
  if (check_open_uio() != 0) {
    return;
  }
  map_addr[PS_PL_ADDR]  = PS_PL_LED; // LED address
  map_addr[PS_PL_VALUE] = num;       // LED value
}

uint8_t read_pixel(uint32_t read_addr) {
  map_addr[PS_PL_ADDR]  = PS_PL_R_ADDR;
  map_addr[PS_PL_VALUE] = read_addr;
  map_addr[PL_PS_ADDR]  = PL_PS_R_DATA;
  return map_addr[PL_PS_VALUE];
}

int get_frame(char filename[])
{
  int i;
  FILE *fp;
  uint8_t *frame;

  open_uio();
  if (check_open_uio() != 0) {
    return 1;
  }

  mapping_device();

  /* malloc frame */
  frame = (uint8_t *)malloc(sizeof(uint8_t) * (IMG_PIXELS));
  if (frame == NULL) {
    printf("cannot malloc frame\n");
    return 1;
  }

  /* pixel-data into frame */
  map_addr[PS_PL_ADDR]  = PS_PL_R_ADDR;
  map_addr[PL_PS_ADDR]  = PL_PS_R_DATA;
  for (i = 0; i < IMG_PIXELS; i++) {
    map_addr[PS_PL_VALUE] = i;
    frame[i] = map_addr[PL_PS_VALUE];
    // frame[i] = read_pixel(i); // before inline
  }
  
  /* open pgm file */
  fp = fopen(filename, "wb");
  if (fp == NULL) {
    fprintf(stderr, "file open failed\n");
    return errno;
  }

  /* write pgm */
  fprintf(fp, "P5\n%d %d\n%d\n", IMG_WIDTH, IMG_HEIGHT, 255);
  if (fwrite(frame, sizeof(uint8_t), IMG_PIXELS, fp) < IMG_PIXELS) {
    fprintf(stderr, "fwrite failed\n");
    return errno;
  }

  if (munmap(map_addr, 4096) != 0) {
    fprintf(stderr, "file munmap failed\n");
    return errno;
  }
  
  fclose(fp);
  free(frame);

  close_uio();

  return 0;
}

// my functions defined below

void hello(void)
{
  printf("Hello World! \n");
}

double add(double a, double b)
{
  double c;
  c = a + b;
  return c;
}

int sum_arr(int arr[], int n)
{
  int i;
  int sum = 0;

  for (i = 0; i < n; i++) {
    sum += arr[i];
  }

  return sum;
}
