PUBLIC memset

.CODE

memset:
        xor eax, eax
    L0:
        mov [rcx+rax], dl
        inc rax
        dec r8
        jnz L0
        mov rax, rcx
        ret
END
