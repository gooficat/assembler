.text

.include "vec.inc"

.globl vec_init, vec_resize_up

# vec: rcx
vec_init:
	push %rcx
	sub $32, %rsp
	mov $1, %rcx
	call malloc
	add $32, %rsp
	pop %rcx
	mov %rax, vec_data(%rcx)
	movq $0, vec_size(%rcx)
	movq $1, vec_cap(%rcx)
	ret
# vec: rcx, data width: rdx
vec_resize_up:
	mov vec_size(%rcx), %rax # let vs = vec_size
	cmp vec_cap(%rcx), %rax # if (vs > vec_cap) {
	jg vec_push_no_realloc
	push %rcx
	mov $2, %rax # let vc = 
	mulq vec_cap(%rcx) # vec_cap * 2
	mov %rax, vec_cap(%rcx) #vec_cap = vc
	mov %rax, %rdx
	mov vec_data(%rcx), %rcx
	sub $32, %rsp
	call realloc # realloc (vec_data, vc)
	add $32, %rsp
	pop %rcx
	mov %rax, vec_data(%rcx) # vec_data = 
vec_push_no_realloc: # } else
	ret
