;%include 'nasmx-1.0\inc\nasmx.inc'

global  main

extern _glOrtho@48
extern _ChangeDisplaySettingsA@8
extern _CreateWindowExA@48
extern _GetDC@4
extern _ChoosePixelFormat@8
extern _SetPixelFormat@12
extern _wglCreateContext@4
extern _wglMakeCurrent@8
extern _ShowCursor@4
extern _glViewport@16
extern _glMatrixMode@4
extern _glLoadIdentity@0
extern _glColor3ub@12
extern _glBegin@4
extern _glVertex2i@8
extern _glEnd@0
extern _SwapBuffers@4
extern _PeekMessageA@20
extern _GetAsyncKeyState@4
extern _ExitProcess@4

XRES    equ     800
YRES    equ     600
 
[section .text]
main:
    push    4                                   ; CDS_FULLSCREEN
    push    dword dms
    call    _ChangeDisplaySettingsA@8
    
    push    0
    push    0
    push    0
    push    0
    push    0
    push    0
    push    0
    push    0
    push    91000000h                           ; WS_POPUP + WS_VISIBLE + WS_MAXIMIZE
    push    0
    push    szEdit
    push    0
    call    _CreateWindowExA@48
    
    push    eax
    call    _GetDC@4
    mov     dword [hDc], eax

    push    dword pfd
    push    eax
    call    _ChoosePixelFormat@8
    
    push    dword pfd
    push    eax
    push    dword [hDc]
    call    _SetPixelFormat@12
    
    push    dword [hDc]
    call    _wglCreateContext@4

    push    eax
    push    dword [hDc]
    call    _wglMakeCurrent@8

    push    0
    call    _ShowCursor@4

    push    YRES
    push    XRES
    push    0
    push    0
    call    _glViewport@16
    
    push    0x1701
    call    _glMatrixMode@4

    call    _glLoadIdentity@0

    sub     esp, 8
    fld1
    fstp    qword [esp]
    sub     esp, 8
    fldz
    fstp    qword [esp]
    sub     esp, 8
    fld     qword [t]
    fstp    qword [esp]
    sub     esp, 8
    fldz
    fstp    qword [esp]
    sub     esp, 8
    fld     qword [r]
    fstp    qword [esp]
    sub     esp, 8
    fldz
    fstp    qword [esp]
    call    _glOrtho@48
    
    push    0x1700
    call    _glMatrixMode@4

    call    _glLoadIdentity@0

.intro_loop:
    
    push    0
    push    0
    push    255
    call    _glColor3ub@12
    
    push    0                                   ; GL_POINTS
    call    _glBegin@4
    
    push    300
    push    400
    call    _glVertex2i@8
    
    call    _glEnd@0
    
    push    dword [hDc]
    call    _SwapBuffers@4
    
    push    1                                   ; PM_REMOVE
    push    0
    push    0
    push    0
    push    0
    call    _PeekMessageA@20
    
    push    1Bh                                 ; VK_ESCAPE
    call    _GetAsyncKeyState@4
    cmp     eax, dword 0
    je      .intro_loop
    
    push    0
    call    _ExitProcess@4
    ret
    
[section .bss]
    hDc:    resd 1

[section .data]
    dms:    dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 156, 1572864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    pfd:    dd 65536, 33, 32, 0, 0, 2097152, 0, 0, 0
    r:      dq 800.0
    t:      dq 600.0
    szEdit: db 'e', 'd', 'i', 't', 0
