.macro $pst p1, p2
    addi \p1, \p1, -2
    st (\p1), \p2
.endm

.macro $ppt p1 p2
    ld \p2, (\p1)
    addi \p1, \p1, 2
.endm


.set  E_SHENTSIZE,  40
.set  SHF_ALLOC  ,  0x2
 
.set  __OFF_E_SHOFF,   32
.set  __OFF_E_SHNUM  ,  48
.set  __OFF_SH_FLAGS ,  8 
.set  __OFF_SH_ADDR  ,  12 
.set  __OFF_SH_OFFSET,  16 
.set  __OFF_SH_SIZE  ,  20 

.set  SD_PORT_ADDR,     22
.set  SD_PORT_AVALID ,  24
.set  SD_PORT_VVALID ,  25
.set  SD_PORT_VALUE  ,  23
.set  SD_PORT_ERROR  ,  26

.set  HEX_PORT_NUMBER,  9
.set  HEX_PORT_ENABLE,  10

.set MAGICNUMBER_L, 0x457F
.set MAGICNUMBER_H, 0x464C

.set PILA_BOOTLOADER, 0xF800

.text
    movi   r7, lo(PILA_BOOTLOADER)
    movhi  r7, hi(PILA_BOOTLOADER)
    movi   r4, lo(read_sd)
    movhi  r4, hi(read_sd)
    

    movi   r0, 0
    $pst   r7, r0 ; variable local e_shoff  6(r7)
    $pst   r7, r0 ; variable local e_shnum  4(r7)
    $pst   r7, r0 ; variable local limit    2(r7)
    $pst   r7, r0 ; variable local position 0(r7)
    
    movi r2, 0xFF
    out HEX_PORT_ENABLE, r2
    
    ; comprovem existencia SD i que no hi hagi errors
__check_error:
    in r1, SD_PORT_ERROR
    out HEX_PORT_NUMBER, r1
    bnz r1, __check_error


    ;Comprovem magic number elf
    movi  r5, 0 ;utilitzem r5 de cursor. Primera addr 0 (Magic number)
    movi  r3, lo(MAGICNUMBER_L)
    movhi r3, hi(MAGICNUMBER_L)
    addi  r1, r5, 0
    jal   r6, r4 ; Crida a read_sd
    cmpeq r2, r3, r1
    addi  r1, r5, 2
    jal   r6, r4
    movi  r3, lo(MAGICNUMBER_H)
    movhi r3, hi(MAGICNUMBER_H)
    cmpeq r1, r3, r1
    and   r1, r1, r2
    bnz    r1, __magicnumber_ok
    halt
    
    ; Obtenim offset dels headers de seccio
__magicnumber_ok:
    movi  r1, __OFF_E_SHOFF
    jal   r6, r4
    st    6(r7), r1
    movi  r1, __OFF_E_SHNUM
    jal   r6, r4
    st    4(r7), r1
    ld    r5, 6(r7)
    movi  r2, E_SHENTSIZE
    mul   r1, r2, r1   ; e_shnum * E_SHENTSIZE
    add   r3, r5, r1   ; R3 conte el limit del bucle
    st    2(r7), r3
__begin_for_headers:
    ld    r3, 2(r7)  ; pillem var local limit de memoria
    cmpltu r1, r5, r3    
    st    (r7), r5   ; guardem la posicio de headers de seccio per utlitar r5
    bz    r1, __end_for_headers
    addi  r1, r5, __OFF_SH_FLAGS
    jal   r6, r4
    movi  r2, SHF_ALLOC
    and   r1, r1, r2
    bz    r1, __epileg_for_headers ; comprovem si te flag ALLOC, sino next   
    
    
    addi  r1, r5, __OFF_SH_ADDR
    jal   r6, r4
    addi  r3, r1, 0  ; R3 <- sh_addr
    addi  r1, r5, __OFF_SH_OFFSET
    jal   r6, r4
    addi  r2, r1, 0  ; R2 <- sh_offset
    addi  r1, r5, __OFF_SH_SIZE
    jal   r6, r4
    addi  r5, r1, 0  ; R5 <- sh_size
    add   r5, r5, r2 ; R5 <- sh_size+s_offset
__begin_for_copy:
    cmpltu r0, r2, r5
    bz    r0, __end_for_copy
    
    addi r1, r2, 0
    jal  r6, r4
    st   (r3), r1    ; Copia efectiva. Valor R1 -> a posicio addr (R3)

    addi  r2, r2, 2  ; incrementem R2 (sh_offset) 2 bytes
    addi  r3, r3, 2  ; incrementem r3 (sh_addr) 2 bytes
    bnz   r2, __begin_for_copy
__end_for_copy:
    
    

__epileg_for_headers:
    ld    r5, (r7)
    movi  r1, E_SHENTSIZE
    add   r5, r5, r1
    bnz   r5, __begin_for_headers

__end_for_headers:
    movi  r1, 0
    movhi r1, 0xC0 

    ; Cleanup and jump to system 
    xor   r0, r0, r0   
    xor   r1, r1, r1   
    xor   r2, r2, r2   
    xor   r3, r3, r3   
    xor   r4, r4, r4   
    xor   r5, r5, r5   
    xor   r6, r6, r6   
    xor   r7, r7, r7   
    movhi r6, 0xC0
    jmp   r6         ; saltem al punt dentrada

read_sd: ; parametre addr a R1, retorn valor a R1
    $pst r7, r0
    $pst r7, r1
    $pst r7, r2
    $pst r7, r3
    $pst r7, r4
    $pst r7, r5
    $pst r7, r6
    
    movi r0, 1
    out  SD_PORT_ADDR, r1
    out  SD_PORT_AVALID, r0
    xor  r0, r0, r0
__polling_while:    
    in   r0, SD_PORT_VVALID
    bz   r0, __polling_while
    in   r2, SD_PORT_VALUE
    st   0xA(r7), r2 ; Posem retorn a R1 (pila)

    $ppt r7, r6
    $ppt r7, r5
    $ppt r7, r4
    $ppt r7, r3
    $ppt r7, r2
    $ppt r7, r1
    $ppt r7, r0
    jmp  r6
