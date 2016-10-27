.data

	a:  .quad 
	b:	.quad 
	c:	.quad 
	d:	.quad 
	e:	.quad 
	f:	.quad 
	g:	.quad
	h:	.quad
	i:	.quad
	j:	.quad
	k:	.quad
	l:	.quad
	m:	.quad
	n:	.quad
	o:	.quad
	p:	.quad
	q:	.quad
	r:	.quad
	s:	.quad
	t:	.quad
	u:	.quad
	v:	.quad
	w:	.quad
	x:	.quad
	y:	.quad
	z:	.quad

	 .text
	.global main
	pushq	$100
	popq	i
L000:
	pushq	i
	pushq	$0
	popq	%rbx
	popq	%rax
	xorq	%rcx, %rcx
                              	cmpq	%rbx, %rax
                              	setge	%ch
                              	pushq	%rcx
	popq	%rcx
	jecxz	L001
	pushq	i
	pushq	$int
	call	printf
	pushq	i
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	popq	i
	popq	%rbx
	popq	%rax
	jmp	L000
L001:
mov $60, %rax
mov $2, %rdi
sysenter
