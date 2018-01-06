section .text
	global _start			; where to start linking from

_start:       ;label of entry point
  mov edx,len ;message length into edx
  mov ecx,msg ;put the message in ecx
  mov ebx,1   ;link stdout to ebx
  mov eax,4   ;put sys_write into eax
  int 0x80    ; call the kernel (execute?)

  mov edx,9   ;set the length to 9
  mov ecx,s2  ;put the result of s2 into ecx (the text to print)
  mov ebx,1   ; link stdout
  mov eax,4   ; link sys_write
  int 0x80    ; call the kernel

  mov edx,new_len
  mov ecx,new_ln
  mov ebx,1
  mov eax,4
  int 0x80

  mov eax,1   ;setup sys_exit
  int 0x80    ; call the kernel

section .data
msg db 'Displaying 9 stars', 0xA; a message
len equ $ - msg ; get the length of the message into len
s2 times 9 db "*"

new_ln db 0xA
new_len equ $ - new_ln
