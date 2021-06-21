#define DEFAULT_QUANTUM 5

int correletras_esp = 0x24C6;
int fibonacci_esp   = 0x40BE;

int correletras_r0 = 1;
int correletras_r1 = 1;
int correletras_r2 = 1;
int correletras_r3 = 1;
int correletras_r4 = 1;
int correletras_r5 = 1;
int correletras_r6 = 1;
int correletras_r7 = 1;

int fibonacci_r0 = 1;
int fibonacci_r1 = 1;
int fibonacci_r2 = 1;
int fibonacci_r3 = 1;
int fibonacci_r4 = 1;
int fibonacci_r5 = 1;
int fibonacci_r6 = 1;
int fibonacci_r7 = 1;

int remaining_quantum=1;
int running=1;

/* running = 0 -> fibonacci a correletras
   running = 1 -> correletras a fibonacci*/
void task_switch()
{
    int espOLD, espNEW;
    if (running) {
        __asm__ (
            "wrs    S4, R7\n\t"
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "ld	%0, 12(r7)\n\t"
            "ld	%1, 10(r7)\n\t"
            "ld	%2, 8(r7)\n\t"
            : "=r" (correletras_r0),
             "=r" (correletras_r1),
             "=r" (correletras_r2)
            :
           );
        
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "ld	%0, 6(r7)\n\t"
            "ld	%1, 4(r7)\n\t"
            "ld	%2, 2(r7)\n\t"
            "ld	%3, 0(r7)\n\t"
            : "=r" (correletras_r3),
             "=r" (correletras_r4),
             "=r" (correletras_r5),
             "=r" (correletras_r6)
            :
           );
        
        espOLD = fibonacci_esp;
    } else {
        __asm__ (
            "wrs    S4, R7\n\t"
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "ld	%0, 12(r7)\n\t"
            "ld	%1, 10(r7)\n\t"
            "ld	%2, 8(r7)\n\t"
            : "=r" (fibonacci_r0),
             "=r" (fibonacci_r1),
             "=r" (fibonacci_r2)
            :
           );
        
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "ld	%0, 6(r7)\n\t"
            "ld	%1, 4(r7)\n\t"
            "ld	%2, 2(r7)\n\t"
            "ld	%3, 0(r7)\n\t"
            : "=r" (fibonacci_r3),
             "=r" (fibonacci_r4),
             "=r" (fibonacci_r5),
             "=r" (fibonacci_r6)
            :
           );
        
        espOLD = correletras_esp;
    }
    
    __asm__ (
        "rds r5, s1\n\t"
        "wrs s1, %1\n\t"
        "addi %0, r5, 0\n\t"
        : "=r" (espNEW)
        : "r" (espOLD));
    
    if (running) {
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "st	12(r7), %0\n\t"
            "st	10(r7), %1\n\t"
            "st	8(r7), %2\n\t"
            :
            : "r" (fibonacci_r0),
             "r" (fibonacci_r1),
             "r" (fibonacci_r2)
           );
        
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "st	6(r7), %0\n\t"
            "st	4(r7), %1\n\t"
            "st	2(r7), %2\n\t"
            "st	0(r7), %3\n\t"
            "rds    R7, S4\n\t"
            :
            : "r" (fibonacci_r3),
             "r" (fibonacci_r4),
             "r" (fibonacci_r5),
             "r" (fibonacci_r6)
           );
        
        correletras_esp = espNEW;
    } else {
         
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "st	12(r7), %0\n\t"
            "st	10(r7), %1\n\t"
            "st	8(r7), %2\n\t"
            :
            : "r" (correletras_r0),
             "r" (correletras_r1),
             "r" (correletras_r2)
           );
        
        __asm__ (
            "movi  r7, 0\n\t"
            "movhi r7, 76\n\t"
            "addi  r7, r7, -14\n\t"
            "st	6(r7), %0\n\t"
            "st	4(r7), %1\n\t"
            "st	2(r7), %2\n\t"
            "st	0(r7), %3\n\t"
            "rds    R7, S4\n\t"
            :
            : "r" (correletras_r3),
             "r" (correletras_r4),
             "r" (correletras_r5),
             "r" (correletras_r6)
           );
        
        fibonacci_esp = espNEW;
    }
    
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
    running = 1;
    __asm__ (  
            "ei\n\t"
            : 
            : );
    
    __asm__ (
        "jmp %0\n\t"
        :
        : "r" (correletras_esp));
    
    while(1);
    return 0; //mai arribarà
}
