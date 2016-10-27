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
	pushq	$1000001
	popq	n
	pushq	$100000000
	popq	s
	pushq	$0
	popq	a
	pushq	$0
	popq	t
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
	pushq	t
	pushq	$0
	popq	%rbx
	popq	%rax
	xorq	%rcx, %rcx
                              	cmpq	%rax, %rbx
                              	sete	%ch
                              	pushq	%rcx
	popq	%rcx
	jecxz	L002
	pushq	n
	popq	d
	pushq	$1
	popq	t
	popq	%rbx
	popq	%rax
	jmp	L003
L002:
	pushq	n
	popq %rax
                    	negq %rax
                    	pushq %rax
	popq	d
	pushq	$0
	popq	t
	popq	%rbx
	popq	%rax
L003:
	pushq	a
	pushq	s
	pushq	d
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
	popq	%rbx
	popq	%rax
	pushq	n
	pushq	$2
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
	pushq	$100000
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
	pushq	$4
	popq	%rbx
	popq	%rax
	imulq	 %rbx
                              	pushq	%rax
	pushq	$int
	call	printf
mov $60, %rax
mov $2, %rdi
sysenter
