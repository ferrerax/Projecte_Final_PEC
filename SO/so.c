#define DEFAULT_QUANTUM 10

struct task_struct
{
    //int PID;
    int register_esp;
    //int total_quantum;
};

struct task_struct correletras;
struct task_struct fibonacci;

int remaining_quantum=1;
int running=0; // 0->correletras, 1-> fibonacci

/* running = 0 -> fibonacci a correletras
   running = 1 -> correletras a fibonacci*/
void task_switch()
{
    int espOLD, espNEW;
    if (running) espOLD = fibonacci.register_esp;
    else         espOLD = correletras.register_esp;
    
    __asm__ (  
            "rds r5, s1\n\t"
            "wrs s1, %1\n\t"
            "addi %0, r5, 0\n\t"
            : "=r" (espNEW)
            : "r" (espOLD));
    
    if (running) correletras.register_esp = espNEW;
    else         correletras.register_esp = espNEW;
    
}

void update_sched_data_rr(void)
{
  remaining_quantum--;
}

int needs_sched_rr(void)
{
  if (remaining_quantum <= 0) return 1;
  return 0;
}

void sched_next_rr(void)
{
  remaining_quantum=DEFAULT_QUANTUM;

  task_switch();
  running = !running;
}

void schedule()
{
  update_sched_data_rr();
  if (needs_sched_rr())
  {
    sched_next_rr();
  }
  
   __asm__ (  
            "jmp r3\n\t"
            : 
            : );
  
}

void init_sched() {
    running = 0;
    correletras.register_esp = 0xD4C6;
    fibonacci.register_esp = 0xF000;
}

void init_interrupts() {
    __asm__ (  
            "ei\n\t"
            : 
            : );
}

int main (void) {

    init_sched();
    
    init_interrupts();
    
    //run_first_program();
    
    while(1);
    
    return 0; //mai arribarà xD
}
