import os

f = open("prova-sd.hex", "wb");

for i in range(0,1024):
    f.write(i.to_bytes(2, byteorder="little", signed=False))


