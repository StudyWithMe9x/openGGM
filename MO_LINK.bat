@echo off
setlocal

set "LINK=%USERPROFILE%\Desktop\ACBNMAY2.lnk"

if not exist "%LINK%" (
    echo Khong tim thay: "%LINK%"
    pause
    exit /b
)

start "" "%LINK%"
timeout /t 5 /nobreak >nul

REM Focus vào cửa sổ vừa mở
powershell -Command "Add-Type @\"
using System;
using System.Runtime.InteropServices;
public class WinFocus {
    [DllImport(\"user32.dll\")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}\"@; Start-Sleep -Seconds 2; $procs = Get-Process | Where-Object {$_.MainWindowHandle -ne 0} | Select-Object -First 1; if($procs) { [WinFocus]::SetForegroundWindow($procs.MainWindowHandle) }"

REM Đợi thêm để ổn định
timeout /t 2 /nobreak >nul

REM Bấm ENTER 1 lần
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}');"

REM Bấm Ctrl + D 1 lần
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('^d');"

endlocal
