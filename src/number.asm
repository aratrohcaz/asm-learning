
section .data ; data/vars
  userMsg db 'Please enter a 4 digit or lower number: '
  lenUserMsg equ $ - userMsg
  dispMsg db 'You entered: '
  lenDispMsg equ $ - dispMsg

section .bss	; unitialised data
  num resb 5

section .text  ; Seems to be causing an issue if it's the first section
  global _start

_start:
  ; Prompt the user
  mov eax, 4
  mov ebx, 1
  mov ecx, userMsg
  mov edx, lenUserMsg
  int 80h

  ; Read and store user input
  mov eax, 3
  mov ebx, 2
  mov ecx, num
  mov edx, 5	; 5 bytes (numeric, 1 byte is for sign) of that information
  int 0x80 	; call the kernel

  ; display the message
  mov eax, 4
  mov ebx, 1
  mov ecx, dispMsg
  mov edx, lenDispMsg
  int 0x80

  ; output the number entered
  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 0x80

  ; Exit - not calling exit returns a seg fault
  mov eax, 1
  mov ebx, 0
  int 80h
