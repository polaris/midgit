%include 'nasmx-1.0\inc\nasmx.inc'
%include 'nasmx-1.0\inc\win32\windows.inc'
%include 'nasmx-1.0\inc\win32\kernel32.inc'
%include 'nasmx-1.0\inc\win32\user32.inc'
%include 'nasmx-1.0\inc\win32\gdi32.inc'
%include 'nasmx-1.0\inc\win32\opengl32.inc'
;%include 'nasmx-1.0\inc\win32\msvcrt.inc'

entry entrypoint

XRES    equ     1024
YRES    equ     786

[section .text]
proc    entrypoint, ptrdiff_t argcount, ptrdiff_t cmdline
locals none
;    invoke  ChangeDisplaySettingsA, ptrdiff_t [dmScreenSettings], 0x00000004
    invoke  CreateWindowExA, 0, szEdit, 0, WS_POPUP + WS_VISIBLE, 0, 0, XRES, YRES, 0, 0, 0, 0
    invoke  GetDC, eax
    mov     ptrdiff_t [hDc], eax
    invoke  ChoosePixelFormat, ptrdiff_t [hDc], pfd
    invoke  SetPixelFormat, ptrdiff_t [hDc], eax, pfd
    invoke  wglCreateContext, ptrdiff_t [hDc]
    invoke  wglMakeCurrent, ptrdiff_t [hDc], eax
    invoke  ShowCursor, FALSE
    invoke  glViewport, 0, 0, XRES, YRES
    invoke  glMatrixMode, 0x1701
    invoke  glLoadIdentity
    invoke  glOrtho, 0, XRES, 0, YRES, -1, 1
    invoke  glMatrixMode, 0x1700
    invoke  glLoadIdentity
.intro_loop:
    invoke  glColor3ub, 255, 255, 255
    invoke  glBegin, 0x0000
    invoke  glVertex2i, 100, 100
    invoke  glEnd
    invoke  SwapBuffers, ptrdiff_t [hDc]
    invoke  PeekMessageA, 0, 0, 0, 0, PM_REMOVE
    invoke  GetAsyncKeyState, VK_ESCAPE
    cmp     eax, dword 0
    je      .intro_loop
    invoke  ExitProcess, 0
endproc

[section .bss]
    hDc:            reserve(ptrdiff_t) 1

[section .data]
    szEdit:         declare(NASMX_TCHAR) NASMX_TEXT("edit"), 0x0
    NASMX_ISTRUC pfd, PIXELFORMATDESCRIPTOR
        NASMX_AT nSize, 0
        NASMX_AT nVersion, 1
        NASMX_AT dwFlags, 33
        NASMX_AT iPixelType, 32
        NASMX_AT cColorBits, 0
        NASMX_AT cRedBits, 0
        NASMX_AT cRedShift, 0
        NASMX_AT cGreenBits, 0
        NASMX_AT cGreenShift, 0
        NASMX_AT cBlueBits, 0
        NASMX_AT cBlueShift, 0
        NASMX_AT cAlphaBits, 0
        NASMX_AT cAlphaShift, 0
        NASMX_AT cAccumBits, 0
        NASMX_AT cAccumRedBits, 0
        NASMX_AT cAccumGreenBits, 0
        NASMX_AT cAccumBlueBits, 0
        NASMX_AT cAccumAlphaBits, 32
        NASMX_AT cDepthBits, 0
        NASMX_AT cStencilBits, 0
        NASMX_AT cAuxBuffers, 0
        NASMX_AT iLayerType, 0
        NASMX_AT bReserved, 0
        NASMX_AT dwLayerMask, 0
        NASMX_AT dwVisibleMask, 0
        NASMX_AT dwDamageMask, 0
    NASMX_IENDSTRUC
    NASMX_ISTRUC dmScreenSettings, DEVMODE
        NASMX_AT dmDeviceName, ""
        NASMX_AT dmSpecVersion, 0
        NASMX_AT dmDriverVersion, 0
        NASMX_AT dmSize, 156
        NASMX_AT dmDriverExtra, 0
        NASMX_AT dmFields, 1572864
        NASMX_AT dmOrientation, 0
        NASMX_AT dmPaperSize, 0
        NASMX_AT dmPaperiLength, 0
        NASMX_AT dmPaperWidth, 0
        NASMX_AT dmScale, 0
        NASMX_AT dmCopies, 0
        NASMX_AT dmDefaultSource, 0
        NASMX_AT dmPrintQuality, 0
        NASMX_AT dmColor, 0
        NASMX_AT dmDuplex, 0
        NASMX_AT dmYResolution, 0
        NASMX_AT dmTTOption, 0
        NASMX_AT dmCollate, 0
        NASMX_AT dmFormName, ""
        NASMX_AT dmUnusedPadding, 0
        NASMX_AT dmBitsPerPel, 0
        NASMX_AT dmPelsWidth, XRES
        NASMX_AT dmPelsHeight, YRES
        NASMX_AT dmDisplayFlags, 0
        NASMX_AT dmDisplayFrequency, 0
        NASMX_AT dmICMMethod, 0
        NASMX_AT dmICMIntent, 0
        NASMX_AT dmMediaType, 0
        NASMX_AT dmDitherType, 0
        NASMX_AT dmReserved1, 0
        NASMX_AT dmReserved2, 0
        NASMX_AT dmPanningWidth, 0
        NASMX_AT dmPanningHeight, 0
    NASMX_IENDSTRUC
