@echo off
:: 检查是否已经添加到开机自启
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "AutoStartFrpAndOne" >nul 2>&1
if %errorLevel% equ 0 (
    goto startPrograms
) else (
    :: 获取当前批处理文件的完整路径
    set "currentPath=%~dp0%~nx0"
    :: 添加到开机自启项
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "AutoStartFrpAndOne" /t REG_SZ /d "%currentPath%" /f
)

:startPrograms
:: 启动frp.exe
start "" "C:\gj\guojam\is\handsome\remote2-3\frp.exe"
:: 启动1.exe
start "" "C:\gj\guojam\is\handsome\remote2-3\1.exe"
