global find_word
extern string_equals

section .text
; rdi = address of a null terminated word name
; rsi = address of the last word
; returns: rax = 0 if not found, otherwise address
find_word: 
    xor rax, rax
.loop:
    test rsi, rsi 
    jz .end 
    push rdi
    push rsi
    add rsi, 8
    call string_equals
    pop rsi
    pop rdi
    test rax, rax
    jnz .success
    mov rsi, [rsi]
    jmp .loop
.success:
    mov rax, rsi
.end:
    ret
