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
.global _main
_main:
	pushq	$0
	call fact
	            	pushq %rax
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$1
	call fact
	            	pushq %rax
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$2
	call fact
	            	pushq %rax
	pushq	$2
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$3
	call fact
	            	pushq %rax
	pushq	$6
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$4
	call fact
	            	pushq %rax
	pushq	$24
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$5
	call fact
	            	pushq %rax
	pushq	$120
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$6
	call fact
	            	pushq %rax
	pushq	$720
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$7
	call fact
	            	pushq %rax
	pushq	$5040
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$8
	call fact
	            	pushq %rax
	pushq	$40320
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$9
	call fact
	            	pushq %rax
	pushq	$362880
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$10
	call fact
	            	pushq %rax
	pushq	$3628800
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
	pushq	$11
	call fact
	            	pushq %rax
	pushq	$39916800
	popq	%rbx
	popq	%rax
	subq	 %rbx, %rax
                              	pushq	%rax
	pushq	$int
	call	printf
mov $60, %rax
mov $2, %rdi
sysenter
