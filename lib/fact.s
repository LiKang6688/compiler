	.section .data

	a:  .long long 8
	b:	.long long 8
	c:	.long long 8
	d:	.long long 8
	e:	.long long 8
	f:	.long long 8
	g:	.long long 8
	h:	.long long 8
	i:	.long long 8
	j:	.long long 8
	k:	.long long 8
	l:	.long long 8
	m:	.long long 8
	n:	.long long 8
	o:	.long long 8
	p:	.long long 8
	q:	.long long 8
	r:	.long long 8
	s:	.long long 8
	t:	.long long 8
	u:	.long long 8
	v:	.long long 8
	w:	.long long 8
	x:	.long long 8
	y:	.long long 8
	z:	.long long 8

	.section .text

	global _start

_start:
	push	$0
	call fact
	            	push %rax
	push	$1
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$1
	call fact
	            	push %rax
	push	$1
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$2
	call fact
	            	push %rax
	push	$2
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$3
	call fact
	            	push %rax
	push	$6
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$4
	call fact
	            	push %rax
	push	$24
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$5
	call fact
	            	push %rax
	push	$120
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$6
	call fact
	            	push %rax
	push	$720
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$7
	call fact
	            	push %rax
	push	$5040
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$8
	call fact
	            	push %rax
	push	$40320
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$9
	call fact
	            	push %rax
	push	$362880
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$10
	call fact
	            	push %rax
	push	$3628800
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	push	$11
	call fact
	            	push %rax
	push	$39916800
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	push	$int
	call	printf
	movl $1,%eax
	int $0x80
