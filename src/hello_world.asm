section .text
    global _start     ;must be declared for linker (ld)

_start:               ;label of the entry point
  mov  edx,len        ;copy the message length into edx
  mov  ecx,msg        ;copy the message into ecx
  mov  ebx,1          ;copy the file descriptor (stdout)
  mov  eax,4          ;copy the system call number to eax (sys_write)
  int  0x80           ; call the kernel

  mov  eax,1          ;system call number (sys_exit)
  int  0x80           ; call the kernel [execute?]

section .data
msg db 'Hello, world agin?!', 0xa  ; string to be printed
len equ $ - msg              ; len equals $ minus message length
