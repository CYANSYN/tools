@echo off
setlocal EnableDelayedExpansion

rem ===== 配置区 =====
set "SV2V=C:\Projects\sv2v-Windows\sv2v-Windows\sv2v.exe"
set "SRC_DIR=C:\Projects\pex8749_bmc-main-fork-qdd\pex8749_bmc-main\src"
set "OUT_FILE=C:\Projects\pex8749_bmc-main-fork-qdd\pex8749_bmc-main\src\out.v"

rem ===== 收集所有 .sv 文件 =====
set FILES=
for /r "%SRC_DIR%" %%f in (*.sv) do (
    set FILES=!FILES! "%%~ff"
)

rem ===== 检查是否找到文件 =====
if "%FILES%"=="" (
    echo No .sv files found in %SRC_DIR%
    pause
    exit /b 1
)

rem ===== 执行转换 =====
"%SV2V%" %FILES% -w "%OUT_FILE%"

echo.
echo Done: %OUT_FILE%
pause