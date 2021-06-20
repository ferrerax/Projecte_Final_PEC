#!/bin/bash


echo "Ensamblando ..."
#compila el ensamblador
sisa-as so.s -o sos.o

echo "Compilando ..."
#compila el c (solo compila)  (para ver el codigo fuente entre el codigo desensamblado hay que compilar con la opcion -O0)
sisa-gcc -g3 -O0 -c -Wall so.c -o so.o
sisa-gcc -g3 -O0 -c -Wall corre_letras.c -o corre_letras.o
sisa-gcc -g3 -O0 -c -Wall fibonacci.c -o fibonacci.o
      
echo "Linkando ..."
#Linkamos los ficheros (la opcion -s es para que genere menos comentarios)
sisa-ld -s -T system.lds sos.o so.o fibonacci.o corre_letras.o -o temp_so.o

#desensamblamos el codigo
sisa-objdump -d --section=.sistema temp_so.o >so.code
sisa-objdump -s --section=.sysdata temp_so.o >so.data

sisa-objdump -d --section=.userCorreletras temp_so.o >corre_letras.code
sisa-objdump -s --section=.userdataCorreletras temp_so.o >corre_letras.data

sisa-objdump -d --section=.userFibonacci temp_so.o >fibonacci.code
sisa-objdump -s --section=.userdataFibonacci temp_so.o >fibonacci.data

./limpiar.pl codigo so.code
./limpiar.pl datos so.data
./limpiar.pl codigo corre_letras.code
./limpiar.pl datos corre_letras.data
./limpiar.pl codigo fibonacci.code
./limpiar.pl datos fibonacci.data

#Linkamos los ficheros (sin la opcion -s es para que genere mas comentarios) y desensamblamos
#(para ver el codigo fuente entre el codigo desensamblado hay que haber compilado con la opcion -O0)
sisa-ld -T system.lds sos.o so.o fibonacci.o corre_letras.o -o temp_so.o

sisa-objdump -S -x -w --section=.sistema temp_so.o >so.dis
sisa-objdump -S -x -w --section=.sysdata temp_so.o >>so.dis

sisa-objdump -S -x -w --section=.userCorreletras temp_so.o >corre_letras.dis
sisa-objdump -S -x -w --section=.userdataCorreletras temp_so.o >>corre_letras.dis

sisa-objdump -S -x -w --section=.userFibonacci temp_so.o >fibonacci.dis
sisa-objdump -S -x -w --section=.userdataFibonacci temp_so.o >>fibonacci.dis

rm so.data.DE2-115.hex so.code.DE2-115.hex fibonacci.data.DE2-115.hex fibonacci.code.DE2-115.hex corre_letras.code.DE2-115.hex corre_letras.data.DE2-115.hex
rm  temp_so.o so.code so.data
rm  corre_letras.code corre_letras.data fibonacci.code fibonacci.data

