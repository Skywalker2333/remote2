@echo off
rem ======================================================================
rem rem 
rem ======================================================================

set "frpcPath=C:\gj\guojam\is\handsome\remote2-3\frpc.exe"
set "configFile=C:\gj\guojam\is\handsome\remote2-3\frpc.ini"


if not exist %frpcPath% (
    echo [错误] frpc.exe 未找到！请检查路径：
    echo %frpcPath%
    pause
    exit /b 1
)

if not exist %configFile% (
    echo [错误] frpc.ini 未找到！请检查路径：
    echo %configFile%
    pause
    exit /b 1
)


echo 
echo Set WshShell = CreateObject("WScript.Shell") > "%temp%\hide_window.vbs"
echo WshShell.Run "%frpcPath% -c %configFile%", 0, False >> "%temp%\hide_window.vbs"
cscript //nologo "%temp%\hide_window.vbs" >nul 2>&1
del "%temp%\hide_window.vbs" /f /q

echo 
exit /b 0
