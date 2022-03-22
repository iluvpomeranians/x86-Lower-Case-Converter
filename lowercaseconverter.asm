;GNU nano 6.2                     
;David Martinez
;November 14th 2021
;Lab 4 Uppercase conversion
;Coen 311

section .data

    message db 'juMping JAck flaSh #1',10,0
    minus db 32

section .bss

section .text
    global _start
_start:
                mov eax, 4
                mov ebx, 1
                mov ecx, message
                mov edx, 22

                int 80h

                mov dh, [minus]   ;write 32 decimal for upper_case conversion
lower_case:     mov al, [ecx]     ;write first char into al
                cmp al, 0x0       ;detect null char
                JE reprint        ;if detected, reprint message
                cmp al, 'a'       ;if not, compare with 'a'
                JB upper_case     ;letter is already upper case(lower ASCII val>
                sub al, [minus]   ;If char is above 'a', then it is lower
                mov [ecx], al     ;so we sub 32 decimal and write back into str>

upper_case:     inc ecx           ;go to next memory cell/next char
                JMP lower_case    ;JMP back to check next char




reprint:        mov eax, 4
                mov ebx, 1
                mov ecx, message
                mov edx, 22

                int 80h

                mov eax, 1
                mov ebx, 0
                int 80h
