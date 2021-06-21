
bootloader: bootloader.o
	sisa-ld -o bootloader bootloader.o

bootloader.o: bootloader.s
	sisa-as -o bootloader.o bootloader.s

dis: bootloader
	sisa-objdump -d bootloader > bootloader.dis

little: little_program.s
	sisa-as -o little_program.o little_program.s
	sisa-ld -o little_program -T little.lds little_program.o
	rm little_program.o
