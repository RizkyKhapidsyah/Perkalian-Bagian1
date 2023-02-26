.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
buffer db 10 dup(?)
title db "Program Perkalian",0
prompt1 db "Masukkan angka pertama: ",0
prompt2 db "Masukkan angka kedua: ",0
result db "Hasil perkalian: ",0

.code
start:
    ;menampilkan judul program
    invoke MessageBox, NULL, addr title, NULL, MB_OK
    
    ;meminta input angka pertama
    invoke MessageBox, NULL, addr prompt1, NULL, MB_OKCANCEL
    .if eax == IDCANCEL
        invoke ExitProcess, 0
    .endif
    invoke StdIn, addr buffer, 10
    invoke atodw, addr buffer
    mov ebx, eax
    
    ;meminta input angka kedua
    invoke MessageBox, NULL, addr prompt2, NULL, MB_OKCANCEL
    .if eax == IDCANCEL
        invoke ExitProcess, 0
    .endif
    invoke StdIn, addr buffer, 10
    invoke atodw, addr buffer
    mul ebx
    
    ;menampilkan hasil perkalian
    invoke MessageBox, NULL, addr result, NULL, MB_OKCANCEL
    invoke dwtoa, eax, addr buffer
    invoke StdOut, addr buffer
    
    invoke ExitProcess, 0
end start