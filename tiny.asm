%include 'windemos.inc'


; entry point
entry entrypoint


; prototypes
proto init_intro
proto do_intro

%define WINDOWED

XRES    equ     640
YRES    equ     480

%ifdef WINDOWED
%define WIN_XRES XRES + 6
%define WIN_YRES YRES + 28
%else
%define WIN_XRES XRES
%define WIN_YRES YRES
%endif

[section .text]
proc    entrypoint, ptrdiff_t argcount, ptrdiff_t cmdline
locals none
    ; create window
    invoke  CreateWindowEx, WS_EX_APPWINDOW + WS_EX_WINDOWEDGE, szEdit, szTitle, WS_VISIBLE + WS_CAPTION + WS_CLIPSIBLINGS + WS_CLIPCHILDREN, 0, 0, WIN_XRES, WIN_YRES, 0, 0, 0, 0
    mov     ptrdiff_t [hWnd], eax
    ; get device context
    invoke  GetDC, ptrdiff_t [hWnd]
    mov     ptrdiff_t [hDc], eax
    ; initialize intro
    invoke  init_intro
    ; get initial time
    ;invoke  timeGetTime
    ;mov     dword [last_time], eax
    ; start intro loop
.intro_loop:
    ; check whether we are done
    cmp     dword [done], dword 0
    jne     .intro_end
    ; start message loop
.message_loop:
    invoke  PeekMessageA, message, 0, 0, 0, PM_REMOVE
    cmp     eax, dword 0
    je      .message_loop_end
    ; check if user pressed ESC
    invoke  GetAsyncKeyState, VK_ESCAPE
    mov     dword [done], eax
    invoke  DispatchMessage, message
    jmp     .message_loop
.message_loop_end:
    ; calculate time diff to the last frame
    ;invoke  timeGetTime
    ;mov     dword [current_time], eax
    ;mov     ebx, eax
    ;sub     eax, dword [last_time]
    ;mov     dword [diff], eax
    ;mov     dword [last_time], ebx
    ; convert integer time diff to float (scaled)
    ;fild    dword [diff]                ; load diff on TOS
    ;fld     qword [scale]               ; load scale on TOS
    ;fmul    st1                         ; scale * diff
    ;fstp    qword [fdiff]               ; store result in fdiff
    ;ffree   st0                         ; clean up TOS
    ; render frame
    invoke  do_intro
    ; show buffer
    invoke  StretchDIBits, ptrdiff_t [hDc], 0, 0, XRES, YRES, 0, 0, XRES, YRES, buffer, bmi, DIB_RGB_COLORS, SRCCOPY
    ; give some time to other processes
    invoke  Sleep, 1
    ; repeat
    jmp     .intro_loop
.intro_end:
    ; cleaning up (is this absoulutely necessary?)
    ;invoke  ReleaseDC, ptrdiff_t [hWnd], ptrdiff_t [hDc]
    ;invoke  DestroyWindow, ptrdiff_t [hWnd]
    ; exit process
    invoke  ExitProcess, NULL
endproc


proc init_intro
    locals none
endproc


proc do_intro
    locals none
endproc


[section .bss]
    hWnd:           reserve(ptrdiff_t) 1
    hDc:            reserve(ptrdiff_t) 1
;    current_time    resd 1
;    last_time       resd 1
;    diff            resd 1
;    fdiff           resq 1
    buffer          resd 307200


[section .data]
    done            dd 0
 ;   scale           dq 0.001
 ;   phase           dq 0.0
    
    szEdit:         declare(NASMX_TCHAR) NASMX_TEXT("edit"), 0x0
    szTitle:        declare(NASMX_TCHAR) NASMX_TEXT(""), 0x0
    
    NASMX_ISTRUC message, MSG
        NASMX_AT hwnd,       NULL
        NASMX_AT message,    NULL
        NASMX_AT wParam,     NULL
        NASMX_AT lParam,     NULL
        NASMX_AT time,       NULL
		NASMX_ISTRUC pt, POINT
			NASMX_AT x,          NULL
			NASMX_AT y,          NULL
		NASMX_IENDSTRUC
    NASMX_IENDSTRUC

    NASMX_ISTRUC bmpRgb, RGBQUAD
        NASMX_AT rgbBlue,           0
        NASMX_AT rgbGreen,          0
        NASMX_AT rgbRed,            0
        NASMX_AT rgbReserved,       0
    NASMX_IENDSTRUC

    NASMX_ISTRUC bmi, BITMAPINFO
        NASMX_ISTRUC bmiHeader, BITMAPINFOHEADER
            NASMX_AT biSize,            40
            NASMX_AT biWidth,           XRES
            NASMX_AT biHeight,          -YRES
            NASMX_AT biPlanes,          1
            NASMX_AT biBitCount,        32
            NASMX_AT biCompression,     BI_RGB
            NASMX_AT biSizeImage,       0
            NASMX_AT biXPelsPerMeter,   0
            NASMX_AT biYPelsPerMeter,   0
            NASMX_AT biClrUsed,         0
            NASMX_AT biClrImportant,    0
        NASMX_IENDSTRUC
        NASMX_AT bmiColors,             bmpRgb
    NASMX_IENDSTRUC