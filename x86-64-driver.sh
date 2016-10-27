
#!/bin/sh
prologue_func()
{
printf  ".data\n\n"
printf  "\ta:  .quad\n"
printf  "\tb:	.quad\n"
printf  "\tc:	.quad\n"
printf  "\td:	.quad\n"
printf  "\te:	.quad\n"
printf  "\tf:	.quad\n"
printf  "\tg:	.quad\n"
printf  "\th:	.quad\n"
printf  "\ti:	.quad\n"
printf  "\tj:	.quad\n"
printf  "\tk:	.quad\n"
printf  "\tl:	.quad\n"
printf  "\tm:	.quad\n"
printf  "\tn:	.quad\n"
printf  "\to:	.quad\n"
printf  "\tp:	.quad\n"
printf  "\tq:	.quad\n"
printf  "\tr:	.quad\n"
printf  "\ts:	.quad\n"
printf  "\tt:	.quad\n"
printf  "\tu:	.quad\n"
printf  "\tv:	.quad\n"
printf  "\tw:	.quad\n"
printf  "\tx:	.quad\n"
printf  "\ty:	.quad\n"
printf  "\tz:	.quad\n\n"
printf  ".text\n"
printf  ".global _main\n"
printf  "_main:\n"
}


epilogue_func()
{
echo 'mov $60, %rax'
echo 'mov $2, %rdi'
echo 'sysenter' # the Intel-originated version
#echo 'syscall'  the AMD-originated version
}

runFile=$(echo $1 | cut -f 1 -d '.' | cut -f 2 -d '/')
# .s filename
sFile="lib/$runFile.s"

# Put assembly file  to sFile
prologue_func > $sFile
./bin/calc3i.exe < "$1" >> $sFile
epilogue_func  >> $sFile


# Compile the assembly file with gcc
gcc -m64 -masm=intel $sFile -o "lib/$runFile"





