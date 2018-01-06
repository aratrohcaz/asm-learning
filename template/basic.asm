SYS_EXIT  equ 1 ; Exit Constant
SYS_READ  equ 3 ; read_ln constant
SYS_WRITE equ 4 ; write constant (not write line)
STDIN     equ 0 ; self explanatory
STDOUT    equ 1 ; self explanatory

;section .bss ; must be before the text section declaring the entry point
;  input1 resb 2 ; input1 is reservation of 2 bytes of memory

;section .data ; initialised vars go in here (text string and what not)
;  message1 db 'Are you having a good time?' ; the text/data
;  len1 equ $ - message1  ; the length of the text/data

section .text
  global _start ; declaring the entry point

_start:
  ;; your code here


exit:
  mov eax, SYS_EXIT ; put the sysexit code into the execute location
  int 0x80          ; call the kernel to execute
