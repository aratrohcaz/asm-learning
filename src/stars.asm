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

  mov eax,1   ;setup sys_exit
  int 0x80    ; call the kernel

section .data
msg db 'Displaying 9 stars', 0xa; a message
len equ $ - msg ; get the length of the message into len
s2 times 9 db "*"
