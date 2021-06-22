OUTPUT_FORMAT("elf32-sisa","elf32-sisa","elf32-sisa")
OUTPUT_ARCH(sisa)
SECTIONS
{
  . = 0xC000 ;
  .text :
  {
    little_program.o(.text)

  }

  . = 0x8000 ;
  .data :
  {
    little_program.o(.data) little_program.o(.bss)

  }

__entry_point = LOADADDR(.text);

}
