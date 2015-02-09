	.file	"badcnt.c"
	.text
	.globl	thread
	.type	thread, @function
thread:
.LFB93:
	.cfi_startproc
	movl	(%rdi), %ecx
	testl	%ecx, %ecx
	jle	.L2
	movl	$0, %eax
.L3:
	movl	cnt(%rip), %edx
	addl	$1, %edx
	movl	%edx, cnt(%rip)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L3
.L2:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE93:
	.size	thread, .-thread
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"usage: %s <niters>\n"
.LC1:
	.string	"BOOM! cnt=%d\n"
.LC2:
	.string	"OK cnt=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB92:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$2, %edi
	je	.L5
	movq	(%rsi), %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %edi
	call	exit
.L5:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 12(%rsp)
	leaq	12(%rsp), %rcx
	movl	$thread, %edx
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	Pthread_create
	leaq	12(%rsp), %rcx
	movl	$thread, %edx
	movl	$0, %esi
	leaq	24(%rsp), %rdi
	call	Pthread_create
	movl	$0, %esi
	movq	16(%rsp), %rdi
	call	Pthread_join
	movl	$0, %esi
	movq	24(%rsp), %rdi
	call	Pthread_join
	movl	cnt(%rip), %eax
	movl	12(%rsp), %ecx
	leal	(%rcx,%rcx), %edx
	cmpl	%eax, %edx
	je	.L6
	movl	cnt(%rip), %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	jmp	.L7
.L6:
	movl	cnt(%rip), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L7:
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE92:
	.size	main, .-main
	.globl	cnt
	.bss
	.align 4
	.type	cnt, @object
	.size	cnt, 4
cnt:
	.zero	4
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
