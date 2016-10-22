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
	push	$732
	pop	a
	push	$2684
	pop	b
L000:
	push	a
	push	b
	pop	%ebx
	pop	%eax
	xor	%rcx, %rcx
                              	cmp	%rbx, %rax
                              	setne	%ch
                              	push	%rcx
	pop	%rcx
	jecxz	L001
	push	a
	push	b
	pop	%ebx
	pop	%eax
	xor	%rcx, %rcx
                              	cmp	%rbx, %rax
                              	setg	%ch
                              	push	%rcx
	pop	%rcx
	jecxz	L002
	push	a
	push	b
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	pop	a
	jmp	L003
L002:
	push	b
	push	a
	pop	%ebx
	pop	%eax
	sub	 %rbx, %rax
                              	push	%rax
	pop	b
L003:
	jmp	L000
L001:
	push	a
	push	$int
	call	printf
	push	a
	push	b
	call gcd
                        	push	%rax
	push	$int
	call	printf
	movl $1,%eax
	int $0x80
