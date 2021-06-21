/*
 *  Canviem l'script per defecte
 *   per adequar-lo a l'arquitectura
 */
OUTPUT_FORMAT("elf32-sisa","elf32-sisa","elf32-sisa")
OUTPUT_ARCH(sisa)
SECTIONS
{
/*
   sistem: 0x6000-0xffff
   usuari: 0x0000-0x5fff


   SO:
     codi: 0x6000 
     data: 0x4000 => 0x8000

   correletras
     codi: 0x1000 => 0x2000
     data: 0x3000 => 0x6000

   fibonacci
     codi: 0x2000 => 0x4000
     data: 0x2500 => 0x4A00

*/

  /* Ens situem a la part de flash */
  . = 0xC000 ;

  /* text space */
  .sistema :
  {
    sos.o(.text) so.o(.text)
    sos.o(.rodata) so.o(.rodata)
    . = ALIGN(2);
  }
  __entry_point = LOADADDR(.sistema);

  PROVIDE (__user_start = .);
  
  . = 0x2000 ; /* Part d'usuari */

  .userCorreletras :
  {
      corre_letras.o(.text)
      corre_letras.o(.rodata)
  }
  
  . = 0x4000 ;
  
  .userFibonacci :
  {
      fibonacci.o(.text)
      fibonacci.o(.rodata)
  }
  
  __user_end = __user_start + SIZEOF(.userCorreletras) + SIZEOF(.userFibonacci);
  
   /* Ens situem en la part de sistema */
  . = 0x8000 ;
  .sysdata : {  sos.o(.data) so.o(.data)  }
  
  . = 0x6000 ;
  .userdataCorreletras : {  corre_letras.o(.data)  }
  
  . = 0x4A00 ;
  .userdataFibonacci : {  fibonacci.o(.data)  }
}
