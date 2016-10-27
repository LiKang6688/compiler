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
	pushq	$1000000
	popq	n
	pushq	$100000000
	popq	s
	pushq	$0
	popq	a
L000:
	pushq	n
	pushq	$0
	popq	%rbx
	popq	%rax
	xorq	%rcx, %rcx
                              	cmpq	%rbx, %rax
                              	setg	%ch
                              	pushq	%rcx
	popq	%rcx
	jecxz	L001
	pushq	a
	pushq	s
	pushq	n
	popq	%rbx
	popq	%rax
	cltd
                              	idivq %rbx
                              	pushq	%rax
	popq	%rbx
	popq	%rax
	addq	 %rbx, %rax
                              	pushq	%rax
	popq	a
	pushq	n
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	popq	n
	popq	%rbx
	popq	%rax
	jmp	L000
L001:
	pushq	a
	pushq	s
	pushq	$1000
	popq	%rbx
	popq	%rax
	cltd
                              	idivq %rbx
                              	pushq	%rax
	popq	%rbx
	popq	%rax
	cltd
                              	idivq %rbx
                              	pushq	%rax
	pushq	$int
	call	printf
mov $60, %rax
mov $2, %rdi
sysenter
