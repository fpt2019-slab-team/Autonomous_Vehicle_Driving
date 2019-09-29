#include <stdio.h>

#define BUF_SIZE 64
#define WIDTH    640
#define HEIGHT   480
#define PIXELS   WIDTH * HEIGHT

int main(void)
{
  FILE *fp;
  char buf[BUF_SIZE];
  unsigned char img[PIXELS];
  int i;
  
  // Lena file open
  fp = fopen("lena.pgm", "rb");
  if (fp == NULL) {
    fprintf(stderr, "error: fopen failed. \n");
    return 1;
  }

  // Skip PGM header
  fgets(buf, sizeof(buf), fp); // magic number 
  fgets(buf, sizeof(buf), fp); // width and height
  fgets(buf, sizeof(buf), fp); // max of luminance

  // Store pixels into img 
  fread(img, sizeof(img), PIXELS, fp);

  // Write initializing lena code
  fp = fopen("lena.txt", "w");
  if (fp == NULL) {
    fprintf(stderr, "error: fopen failed. \n");
    return 1;
  }
  
  for (i = 0; i < PIXELS; i++) {
    fprintf(fp, "%d: lena <= 8'h%02x; \n", i, img[i] & 0xff);
  }
  
  fclose(fp);
  
  return 0;
}
