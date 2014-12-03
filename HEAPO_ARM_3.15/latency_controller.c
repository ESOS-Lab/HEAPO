#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <time.h>

void usage();

// 3rd_layer
int nvm_read(int seg, int address);
int nvm_write(int seg, int address, int data);
int nvm_power_off();
int nvm_power_on();
int nvm_ro_region_set(int begin, int end);

// 2nd_layer
int get_DIP(int DIP_pin);                //current value of DIP[0~3]
int get_LED(int LED_pin);                //current value of LED[0~5]
int set_LED(int LED_pin, int LED_value); //set value of LED[0~5] val[0~1]
int get_SEG();                           //current memory segment value
int set_SEG(int SEG_num);                //set memory segment val[0~3]
int get_SR();                            //current self refresh status
int set_SR(int ONnOFF);                  //set self refresh status val[0~1]
int mem_read(int address);               //read nvm physical address
int mem_write(int address, int data);    //write nvm physical address

// 1st-layer  -> [Warning] fully understand the system before using it directly.
int get_GPIO(int GPIO_pin, int InO);
int set_GPIO(int GPIO_pin, int GPIO_value);
int cmd_execution(char *name, char *value, int RnW);
int ipow(int base, int exp);

// global variables
char* temp_file_name = "temp_esal";
int base_GPIO = 54;
int base_SEG  = 0;
int base_SR   = 2;
int base_LED  = 3;
int base_DIP  = 9;
int nvm_size  = 31; //in bit
int seg_size  = 2;  //in bit
int RO_begin = 0;
int RO_end   = 0;
int nvm_base = 0x40000000;


// for Final Demo
// hello!
int hello_addr = 0x10000000;
int hello_intv = 0x01000000;
int hello_str_len = 28;
char* hello_str = "Hello, this is ESA H1 board.";

//LED
long long get_time() {
   struct timeval te;
   gettimeofday(&te, NULL);
   long long msec = te.tv_sec*1000LL + te.tv_usec/1000;

   return msec;
}
void wait_msec(unsigned int in_msec) {
   long long retTime = get_time() + (long long) in_msec;
   while (get_time() < retTime);
}
//int sec_timer = 667*1024*1024;

// Segmentation
int seg_addr = 0x20000000;
int seg_data[4] = {0x01020304, 0x11121314, 0x21222324, 0x31323334};

// Benchmark
int bench_addr = 0x30000000;
int bench_size = 1024*1024;
void bench_read() {
  void * ptr;
  int fd, dump;
  fd = open("/dev/mem", O_RDONLY );
  dump = open("/dump", O_WRONLY | O_CREAT);
  if(fd < 0) {
    perror("open");
    return;
  }

  ptr = mmap(0, bench_size, PROT_READ, MAP_SHARED, fd, 0x40000000 + bench_addr);
  write(dump, ptr, bench_size);
  munmap(ptr, bench_size);

  close(fd);
  close(dump);
}

void bench_write() {
  void * ptr;
  int fd, dump;
  fd = open("/dev/mem", O_WRONLY );
  dump = open("/dump", O_RDONLY | O_CREAT);
  if(fd < 0) {
    perror("open");
    return;
  }

  ptr = mmap(0, bench_size, PROT_WRITE, MAP_SHARED, fd, 0x40000000 + bench_addr);
  write(ptr, dump, bench_size);
  munmap(ptr, bench_size);

  close(fd);
  close(dump);
}



int main(int argc, char *argv[]) {

  
  unsigned long read_latency, write_latency;
  
  read_latency = atoi(argv[1]);
  write_latency = atoi(argv[2]);

  printf("write latency bitmap : ");

  if(write_latency & 0x08){       
      printf("1");
      set_GPIO(base_GPIO + 23, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 23, 0);
      printf("0");
  }

  if(write_latency & 0x04){       
      printf("1");
      set_GPIO(base_GPIO + 22, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 22, 0);
      printf("0");
  }

  if(write_latency & 0x02){       
      printf("1");
      set_GPIO(base_GPIO + 21, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 21, 0);
      printf("0");
  }

  if(write_latency & 0x01){       
      printf("1");
      set_GPIO(base_GPIO + 20, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 20, 0);
      printf("0");
  }

      printf("\n");
      printf("read latency bitmap : ");

  if(read_latency & 0x08){       
      printf("1");
      set_GPIO(base_GPIO + 27, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 27, 0);
      printf("0");
  }

  if(read_latency & 0x04){       
      printf("1");
      set_GPIO(base_GPIO + 26, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 26, 0);
      printf("0");
  }

  if(read_latency & 0x02){       
      printf("1");
      set_GPIO(base_GPIO + 25, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 25, 0);
      printf("0");
  }

  if(read_latency & 0x01){       
      printf("1");
      set_GPIO(base_GPIO + 24, 1);
  }
  else
  {
      set_GPIO(base_GPIO + 24, 0);
      printf("0");
  }

      printf("\n");
/*  if (!(argc == 2) ||
      !(atoi(argv[1]) <= 6 && atoi(argv[1]) >= 0) )
  {
    usage();
    return 0;
  }

  switch (atoi(argv[1])) {
    case 0: //Initialization
      printf("[Initialization] Start\n");
      set_LED(0, 0);
      set_LED(1, 0);
      set_LED(2, 0);
      set_LED(3, 0);
      set_LED(4, 0);
      set_LED(5, 0);
      printf("{Initialization] LEDs are set to (%d, %d, %d, %d, %d, %d)\n", get_LED(0), get_LED(1), get_LED(2), get_LED(3), get_LED(4), get_LED(5));
     
      int i; 
      for (i=0; i<hello_str_len; i++) {
        nvm_write(0, hello_addr + hello_intv*i, (int) hello_str[i]);
      }
      printf("[Initialization] String hello! is written at %x\n", hello_addr);
    break;
      
    case 1:{ //hello 
      char hello_buffer[100];

      int i;
      for (i=0; i<hello_str_len; i++) {
        hello_buffer[i] = (char) nvm_read(0, hello_addr + hello_intv*i);
        hello_buffer[i+1] = '\0';
      }
      printf("[hello!] stored addr: %x\n", hello_addr);
      printf("[hello!] stored data: %x\n", hello_buffer);
      printf("[hello!] meaning is : %s\n", hello_buffer);
    break;}

    case 2: //LED
      printf("{LED] Start values are (%d, %d, %d, %d, %d, %d)\n", get_LED(0), get_LED(1), get_LED(2), get_LED(3), get_LED(4), get_LED(5));
      printf("{LED] CTRL+C to stop\n");

      set_GPIO(base_GPIO + 20, 1);
      set_GPIO(base_GPIO + 21, 1);
      set_GPIO(base_GPIO + 22, 1);
      set_GPIO(base_GPIO + 23, 1);
      set_GPIO(base_GPIO + 24, 1);
      set_GPIO(base_GPIO + 25, 1);
      set_GPIO(base_GPIO + 26, 1);
      set_GPIO(base_GPIO + 27, 1);

      int hello_cnt = 0;
      while (1) {
        wait_msec(1000);
        hello_cnt++;
        if (hello_cnt % 2 == 0) { 
          set_LED(0, 0);
          set_LED(1, 1);
          set_LED(2, 0);
          set_LED(3, 1);
          set_LED(4, 0);
          set_LED(5, 1);
        } else {
          set_LED(0, 1);
          set_LED(1, 0);
          set_LED(2, 1);
          set_LED(3, 0);
          set_LED(4, 1);
          set_LED(5, 0);
        }
      } 
    break;

    case 3:{ //DIP
      int DIP[4] = {get_DIP(0), get_DIP(1), get_DIP(2), get_DIP(3)};
      printf("{DIP] DIP values are (%d, %d, %d, %d)\n", DIP[0], DIP[1], DIP[2], DIP[3]);
      set_LED(0, DIP[0]);
      set_LED(1, DIP[1]);
      set_LED(2, DIP[2]);
      set_LED(3, DIP[3]);
      set_LED(4, 0);
      set_LED(5, 0);
      printf("{DIP] LEDs are set to (%d, %d, %d, %d)\n", get_LED(0), get_LED(1), get_LED(2), get_LED(3));
    break;}

    case 4:{ //Segmentation
      int i;
      printf("[Segmentation] (seg, addr, data)\n");
      for (i=0; i<4; i++) {
        nvm_write(i, seg_addr, seg_data[i]);
        printf("[Segmentation] (%x, %x, %08x)\n", i, seg_addr, nvm_read(i, seg_addr));
      }
    break;}

    case 5:{ //Benchmark
      long long start_time = 0ll;
      long long end_time = 0ll;
      start_time = get_time();
      printf("[Benchmark] Traffic start @ time : %lld\n", start_time);
      bench_read();
      end_time = get_time();
      printf("[Benchmark] Traffic done  @ time : %lld\n", end_time);
      printf("[Benchmark] Total execution time : %lld\n", end_time - start_time);
    break;}

    default:
      printf("[main] Invalid option: %d\n", atoi(argv[1]));
    break;
  } 
*/


	
  return 0;
}

void usage() {
  char * exe_name = "run.exe";
  printf("Usage: ./%s (test_num)\n", exe_name);
  printf("Ex:    ./%s 0 : Initialization\n", exe_name);
  printf("       ./%s 1 : hello!\n", exe_name);
  printf("       ./%s 2 : LED\n", exe_name);
  printf("       ./%s 3 : DIP\n", exe_name);
  printf("       ./%s 4 : Segmentation\n", exe_name);
  printf("       ./%s 5 : Benchmark\n", exe_name);

  return;
}

//3rd_layer
int nvm_read(int seg, int address) {
  if (seg > ipow(2,seg_size) - 1) {
    printf("[nvm_read] Warning! ignore an invalid memory access: seg %x is not in [0-3]\n", seg);
    return -1;
  }

  set_SEG(seg);
  return mem_read(address);
}

int nvm_write(int seg, int address, int data) {
  if (seg > ipow(2,seg_size)-1) {
    printf("[nvm_write] Warning! ignore an invalid memory access: seg %x is not in [0-3]\n", seg);
    return -1;
  }

  if (address >= RO_begin && address < RO_end) {
    printf("[nvm_write] Warning! ignore an write request on RO region: %x is in [%x-%x]\n", address, RO_begin, RO_end);
    return -2;
  }

  set_SEG(seg);
  return mem_write(address, data);
}

int nvm_power_off() {
  set_SR(0);
  if (get_SR() == 1)
    return -1;
  else
    return 0;
}

int nvm_power_on() {
  set_SR(1);
  if (get_SR() == 1)
    return 0;
  else
    return -1;
}

int nvm_ro_region_set(int begin, int end) {
  RO_begin = begin;
  RO_end   = end;
  printf("[nvm_ro_region_set] RO region: [%x-%x]\n", RO_begin, RO_end);
  return 0;
}

//2nd-layer
int get_DIP(int DIP_pin) {
  if (!(DIP_pin   <= 3 && DIP_pin   >= 0) )
  {
    printf("[get_DIP] Warning! ignore an invalid access to DIP: %d is not in [0~3]\n", DIP_pin);
    return -1;
  }

  int GPIO_pin = DIP_pin + base_GPIO + base_DIP;

  return get_GPIO(GPIO_pin, 1);
}

int get_LED(int LED_pin) {
  if (!(LED_pin   <= 5 && LED_pin   >= 0) )
  {
    printf("[get_LED] Warning! ignore an invalid access to LED: %d is not in [0~5]\n", LED_pin);
    return -1;
  }

  int GPIO_pin = LED_pin + base_GPIO + base_LED;

  return get_GPIO(GPIO_pin, 0);
}

int set_LED(int LED_pin, int LED_value) {
  if (!(LED_pin   <= 5 && LED_pin   >= 0) ||
      !(LED_value <= 1 && LED_value >= 0) )
  {
    printf("[set_LED] Warning! ignore an invalid access to LED: (%d, %d) is not in ([0~5], [0~1])\n", LED_pin, LED_value);
    return -1;
  }

  int GPIO_pin = LED_pin + base_GPIO + base_LED;
  int GPIO_value = LED_value;

  return set_GPIO(GPIO_pin, GPIO_value);
}

int get_SEG() {
  int SEG0_pin = base_GPIO + base_SEG;
  int SEG1_pin = base_GPIO + base_SEG + 1;

  int SEG_num = (get_GPIO(SEG1_pin, 0) < 1) + get_GPIO(SEG0_pin, 0);

  return SEG_num;
}

int set_SEG(int SEG_num) {
  if ( !(SEG_num   <= 3 && SEG_num   >= 0) )
  {
    printf("[set_SEG] Warning! ignore an invalid access to mem_segment: %d is not in [0~3]\n", SEG_num);
    return -1;
  }

  int SEG0_pin = base_GPIO + base_SEG;
  int SEG1_pin = base_GPIO + base_SEG + 1;
  
  return set_GPIO(SEG0_pin, SEG_num%2) + set_GPIO(SEG1_pin, SEG_num/2);
}

int get_SR() {
  int SR_pin = base_GPIO + base_SR;
  int SR_status = (get_GPIO(SR_pin, 0))? 1 : 0;
  return SR_status;
}

int set_SR(int ONnOFF) {
  int SR_pin = base_GPIO + base_SR;
  int SR_status = (ONnOFF != 0)? 1: 0;
  return set_GPIO(SR_pin, SR_status);
}

int mem_read(int address) {
  int * map;
  int fd, i;
  
  fd = open("/dev/mem", O_RDWR);

  int addr = nvm_base + address;
  map = mmap(NULL, sizeof(int), PROT_READ, MAP_SHARED, fd, addr);
  int result = *map;
  //munmap(map, sizeof(int));
  
  return result;
}

int mem_write(int address, int data) {
  int * map;
  int fd, i;
  
  fd = open("/dev/mem", O_RDWR);

  int addr = nvm_base + address;
  map = mmap(NULL, sizeof(int), PROT_WRITE, MAP_SHARED, fd, addr);
  *map = data;
  //munmap(map, sizeof(int));

  return 0;
}

//1st-layer
int get_GPIO(int GPIO_pin, int InO) {
  int buf_size = 100;
  char buf1[buf_size];
  char buf2[buf_size];
  char * in = "in";
  char *out = "out";
  char *dummy = "dummy";

  int result = -1;
  if (InO == 1) {
    sprintf(buf1, "/sys/class/gpio/export");
    sprintf(buf2, "%d", GPIO_pin);
    cmd_execution(buf1, buf2, (int)0);

    sprintf(buf1, "/sys/class/gpio/gpio%d/direction", GPIO_pin);
    cmd_execution(buf1, in, (int)0);

    sprintf(buf1, "/sys/class/gpio/gpio%d/value", GPIO_pin);
    result = cmd_execution(buf1, dummy, (int)1);
 
  } else {  
    sprintf(buf1, "/sys/class/gpio/gpio%d/value", GPIO_pin);
    result = cmd_execution(buf1, dummy, (int)1);

    if (result == -2)
      printf("[get_GPIO] GPIO%d is not available yet. Please set_GPIO() it to export\n", GPIO_pin);
  }

  return result;
}

int set_GPIO(int GPIO_pin, int GPIO_value) {
  int buf_size = 100;
  char buf1[buf_size];
  char buf2[buf_size];
  char * in = "in";
  char *out = "out";
  char *dummy = "dummy";

  sprintf(buf1, "/sys/class/gpio/export");
  sprintf(buf2, "%d", GPIO_pin);
  cmd_execution(buf1, buf2, (int)0);

  sprintf(buf1, "/sys/class/gpio/gpio%d/direction", GPIO_pin);
  cmd_execution(buf1, out, (int)0);

  sprintf(buf1, "/sys/class/gpio/gpio%d/value", GPIO_pin);
  sprintf(buf2, "%d", GPIO_value);
  cmd_execution(buf1, buf2, (int)0);
 
  return 0;
}

int cmd_execution(char *name, char *value, int RnW) {
  int buffer = -1;
  FILE *fp;

  if (RnW == 1) {
    fp = fopen(name, "r");
    if (fp == NULL) {
      return -2;
    }
    fscanf(fp, "%d", &buffer);
    fclose(fp);
  } else {
    fp = fopen(name, "w");
    fprintf(fp, "%s", value);
    fclose(fp);
    buffer = 0;
  }

  //printf("file: %s, value:%s, RnW:%d, buffer:%d\n", name, value, RnW, buffer);

  return buffer;
}

int ipow(int base, int exp)
{
    int result = 1;
    while (exp)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        base *= base;
    }

    return result;
}


