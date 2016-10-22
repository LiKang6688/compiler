
#!/bin/sh
prologue_func()
{
printf  "\t.section .data\n\n"
printf  "\ta:  .long long 8\n"
printf  "\tb:	.long long 8\n"
printf  "\tc:	.long long 8\n"
printf  "\td:	.long long 8\n"
printf  "\te:	.long long 8\n"
printf  "\tf:	.long long 8\n"
printf  "\tg:	.long long 8\n"
printf  "\th:	.long long 8\n"
printf  "\ti:	.long long 8\n"
printf  "\tj:	.long long 8\n"
printf  "\tk:	.long long 8\n"
printf  "\tl:	.long long 8\n"
printf  "\tm:	.long long 8\n"
printf  "\tn:	.long long 8\n"
printf  "\to:	.long long 8\n"
printf  "\tp:	.long long 8\n"
printf  "\tq:	.long long 8\n"
printf  "\tr:	.long long 8\n"
printf  "\ts:	.long long 8\n"
printf  "\tt:	.long long 8\n"
printf  "\tu:	.long long 8\n"
printf  "\tv:	.long long 8\n"
printf  "\tw:	.long long 8\n"
printf  "\tx:	.long long 8\n"
printf  "\ty:	.long long 8\n"
printf  "\tz:	.long long 8\n\n"
printf  "\t.section .text\n\n"
printf  "\tglobal _start\n\n"
printf  "_start:\n"
}


epilogue_func()
{
echo '	movl $1,%eax
	int $0x80'
}

runFile=$(echo $1 | cut -f 1 -d '.' | cut -f 2 -d '/')
# .s filename
sFile="lib/$runFile.s"

# Put assembly file  to sFile
prologue_func > $sFile
./bin/calc3i.exe < "src/$1" >> $sFile
epilogue_func  >> $sFile







