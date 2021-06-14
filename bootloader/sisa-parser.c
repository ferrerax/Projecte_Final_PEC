#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<errno.h>

#define E_SHENTSIZE 40
#define SHF_ALLOC   0x2

#define __OFF_E_SHOFF   32
#define __OFF_E_SHNUM   48
#define __OFF_SH_FLAGS  8 
#define __OFF_SH_ADDR   12 
#define __OFF_SH_OFFSET 16 
#define __OFF_SH_SIZE   20 



int main(int argc, char *argv[]) {
    char *filename = argv[1];

    FILE *fd;

    fd = fopen(filename, "r");
    if(fd == NULL) exit(1);

    ssize_t size_read;

    char magic_number[5];
    size_read = fread(magic_number, 1, 4, fd);
    magic_number[5] = 0x0;
    

    printf("%hhX\n", magic_number[0]);
    printf("%s\n", &magic_number[1]);

    u_int32_t e_shoff;
    u_int16_t e_shstrndx;
    u_int16_t e_shnum;

    fseek(fd, 32, SEEK_SET);
    fread(&e_shoff, 4, 1, fd);

    fseek(fd, 48, SEEK_SET);
    fread(&e_shnum, 2, 1, fd);
    // Just a continuacio es troba el seguent camp que ens interessa.
    fread(&e_shstrndx, 2, 1, fd);

    printf("Section Header offset: %X\n", e_shoff);
    printf("Index of the name's section in the table: %hX\n", e_shstrndx);

    int names_section_header = e_shoff + E_SHENTSIZE*e_shstrndx;

    u_int32_t sh_offset_names;
    fseek(fd, names_section_header+16, SEEK_SET);
    fread(&sh_offset_names, 4, 1, fd);

   // Iterar per els section headers per obtenir sh_addr i sh_offset, nomes
   // d'aquelles sections que tenen la flag SHF_ALLOC a sh_flags 
   int position;
   u_int16_t sh_flags;
   u_int16_t sh_addr;
   u_int16_t sh_offset;
   u_int16_t sh_size;
   for(position = e_shoff; position < e_shoff + (e_shnum*E_SHENTSIZE); position+=E_SHENTSIZE) {
       fseek(fd, position+__OFF_SH_FLAGS, SEEK_SET);
       fread(&sh_flags, 2, 1, fd);
       if(sh_flags & SHF_ALLOC) {
           // Afagem addr, size i offset i llegim
            fseek(fd, position+__OFF_SH_ADDR, SEEK_SET);
            fread(&sh_addr, 2, 1, fd);

            fseek(fd, position+__OFF_SH_OFFSET, SEEK_SET);
            fread(&sh_offset, 2, 1, fd);

            fseek(fd, position+__OFF_SH_SIZE, SEEK_SET);
            fread(&sh_size, 2, 1, fd);

            printf("Allocatable section detected.  Offset: %04X, Size: %04X.\nIt will be copied at address %04X.\n\n", sh_offset, sh_size, sh_addr);
       }
   }

}
