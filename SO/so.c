#define DEFAULT_QUANTUM 10

int correletras_esp = 0x24C6;
int fibonacci_esp   = 0x40BE;

int remaining_quantum=1;
int running=1; // 0->correletras, 1-> fibonacci

/* running = 0 -> fibonacci a correletras
   running = 1 -> correletras a fibonacci*/
void task_switch()
{
    int espOLD, espNEW;
    if (running) espOLD = fibonacci_esp;
    else         espOLD = correletras_esp;
    
    __asm__ (  
            "rds r5, s1\n\t"
            "wrs s1, %1\n\t"
            "addi %0, r5, 0\n\t"
            : "=r" (espNEW)
            : "r" (espOLD));
    
    if (running) correletras_esp = espNEW;
    else         fibonacci_esp = espNEW;
    
}
void sched_next_rr(void)
{
  remaining_quantum=DEFAULT_QUANTUM;
  task_switch();
  running = !running;
}

void schedule()
{
  remaining_quantum--;
  
  if (remaining_quantum <= 0) 
  {
      remaining_quantum=DEFAULT_QUANTUM;
      task_switch();
      running = !running;
  }
   __asm__ (  
            "ld	r6, 0(r7)\n\t"
            "ld	r5, 2(r7)\n\t"
            "addi r7, r7, 6\n\t"
            "jmp r3\n\t"
            : 
            : );
}

int main (void) {
    running = 0;
    __asm__ (  
            "ei\n\t"
            : 
            : );
    
    while(1);
    return 0; //mai arribarà xD
}
