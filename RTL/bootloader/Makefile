
bootloader: bootloader.o
	sisa-ld -o bootloader bootloader.o

bootloader.o: bootloader.s
	sisa-as -o bootloader.o bootloader.s

dis: bootloader
	sisa-objdump -d bootloader > bootloader.dis

