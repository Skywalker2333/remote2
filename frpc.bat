@echo off
rem ======================================================================
rem 无窗口运行 frpc.exe -c frpc.ini 批处理脚本
rem 请先修改下方的 frpcPath 和 configFile 为实际路径
rem ======================================================================

set "frpcPath=C:\gj\guojam\is\handsome\remote2-3\frpc.exe"
set "configFile=C:\gj\guojam\is\handsome\remote2-3\frpc.ini"

rem ----------------------------------------------------------------------
rem 检查文件是否存在（路径必须正确，含空格或中文需用英文引号包裹）
rem ----------------------------------------------------------------------
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

rem ----------------------------------------------------------------------
rem 无窗口运行（通过VBScript隐藏窗口，避免命令行窗口闪烁）
rem ----------------------------------------------------------------------
echo 正在后台运行 frpc...（无窗口模式）
echo Set WshShell = CreateObject("WScript.Shell") > "%temp%\hide_window.vbs"
echo WshShell.Run "%frpcPath% -c %configFile%", 0, False >> "%temp%\hide_window.vbs"
cscript //nologo "%temp%\hide_window.vbs" >nul 2>&1
del "%temp%\hide_window.vbs" /f /q

rem ----------------------------------------------------------------------
rem 可选：显示成功提示（如需静默运行，可删除下方行）
rem ----------------------------------------------------------------------
echo 运行成功！frpc 已在后台以无窗口模式启动。
exit /b 0