section .text
%include "colon.inc"

extern read_word
extern find_word
extern print_newline
extern print_string
extern print_error
extern string_length
extern exit

global _start

section .data
msg_n_found: db "NOT FOUND (",0


%include "words.inc"
    
section .text
_start:

    mov r8, rsp
    sub rsp, 256
    mov rdi, rsp
    call read_word
    mov rdi, rax
    mov rsi, next
    call find_word
    test rax, rax
    jz .n_found

    add rax, 8
    push rax
    mov rax, [rsp]
    mov rdi, rax
    call string_length
    pop rdi
    add rdi, rax
    inc rdi
    call print_string
    call print_newline
    jmp .close			 

.n_found:
    mov rdi, msg_n_found

    call print_error
    call print_newline
    
.close
    mov rsp, r8
    pop rbp
    mov rdi, 0
    call exit



