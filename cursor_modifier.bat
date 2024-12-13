@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: �汾��
set "VERSION=1.0.1"

:: �������
for /f "tokens=2 delims==" %%a in ('wmic os get OSLanguage /value') do set OSLanguage=%%a
if "%OSLanguage%"=="2052" (
    set "LANG=cn"
) else (
    set "LANG=en"
)

:: �������ı�
if "%LANG%"=="cn" (
    set "SUCCESS_MSG=[��] �����ļ��ѳɹ����£�"
    set "RESTART_MSG=[!] ���ֶ����� Cursor ��ʹ������Ч"
    set "READING_CONFIG=���ڶ�ȡ�����ļ�..."
    set "GENERATING_IDS=���������µı�ʶ��..."
    set "CHECKING_PROCESSES=���ڼ�������е� Cursor ʵ��..."
    set "CLOSING_PROCESSES=���ڹر� Cursor ʵ��..."
    set "PROCESSES_CLOSED=���� Cursor ʵ���ѹر�"
    set "PLEASE_WAIT=���Ժ�..."
) else (
    set "SUCCESS_MSG=[��] Configuration file updated successfully!"
    set "RESTART_MSG=[!] Please restart Cursor manually for changes to take effect"
    set "READING_CONFIG=Reading configuration file..."
    set "GENERATING_IDS=Generating new identifiers..."
    set "CHECKING_PROCESSES=Checking for running Cursor instances..."
    set "CLOSING_PROCESSES=Closing Cursor instances..."
    set "PROCESSES_CLOSED=All Cursor instances have been closed"
    set "PLEASE_WAIT=Please wait..."
)

:: ������ԱȨ��
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ���Թ���Ա������д˽ű�
    echo Please run this script as administrator
    pause
    exit /b 1
)

:: �������ID
:generateId
set "id="
for /L %%i in (1,1,32) do (
    set /a "r=!random! %% 16"
    set "hex=0123456789abcdef"
    for %%j in (!r!) do set "id=!id!!hex:~%%j,1!"
)
exit /b

:: ����UUID
:generateUUID
set "uuid="
for /L %%i in (1,1,32) do (
    set /a "r=!random! %% 16"
    set "hex=0123456789abcdef"
    for %%j in (!r!) do set "uuid=!uuid!!hex:~%%j,1!"
    if %%i==8 set "uuid=!uuid!-"
    if %%i==12 set "uuid=!uuid!-"
    if %%i==16 set "uuid=!uuid!-"
    if %%i==20 set "uuid=!uuid!-"
)
exit /b

:: ������
:main
cls
call :printBanner

echo %CHECKING_PROCESSES%
tasklist | find /i "Cursor.exe" >nul
if %errorLevel% equ 0 (
    echo %CLOSING_PROCESSES%
    taskkill /F /IM "Cursor.exe" >nul 2>&1
    timeout /t 2 >nul
    echo %PROCESSES_CLOSED%
)

set "CONFIG_PATH=%APPDATA%\Cursor\User\globalStorage\storage.json"
echo %READING_CONFIG%

echo %GENERATING_IDS%
call :generateId
set "machineId=!id!"
call :generateId
set "macMachineId=!id!"
call :generateUUID
set "devDeviceId=!uuid!"
call :generateId
set "sqmId=!id!"

:: ��������Ŀ¼
if not exist "%APPDATA%\Cursor\User\globalStorage" (
    mkdir "%APPDATA%\Cursor\User\globalStorage"
)

:: ���������ļ�
(
echo {
echo     "telemetry.macMachineId": "%macMachineId%",
echo     "telemetry.machineId": "%machineId%",
echo     "telemetry.devDeviceId": "%devDeviceId%",
echo     "telemetry.sqmId": "%sqmId%",
echo     "lastModified": "%date:~10,4%-%date:~4,2%-%date:~7,2%T%time:~0,2%:%time:~3,2%:%time:~6,2%Z",
echo     "version": "%VERSION%"
echo }
) > "%CONFIG_PATH%"

echo.
echo ��������������������������������������������������������������������������������
echo %SUCCESS_MSG%
echo %RESTART_MSG%
echo ��������������������������������������������������������������������������������
echo.
echo Config file location:
echo %CONFIG_PATH%
echo.
pause
exit /b

:: ��ӡbanner
:printBanner
echo.
echo     �������������[�����[   �����[�������������[ ���������������[ �������������[ �������������[
echo    �����X�T�T�T�T�a�����U   �����U�����X�T�T�����[�����X�T�T�T�T�a�����X  �T�T�����[�����X�T�T�����[
echo    �����U     �����U   �����U�������������X�a���������������[�����U   �����U�������������X�a
echo    �����U     �����U   �����U�����X�T�T�����[�^�T�T�T�T�����U�����U   �����U�����X�T�T�����[
echo    �^�������������[�^�������������X�a�����U  �����U���������������U�^�������������X�a�����U  �����U
echo     �^�T�T�T�T�T�a �^�T�T�T�T�T�a �^�T�a  �^�T�a�^�T�T�T�T�T�T�a �^�T�T�T�T�T�a �^�T�a  �^�T�a
echo.
echo              ^>^> Cursor ID Modifier v1.0 ^<^<
echo         [ By Pancake Fruit Rolled Shark Chili ]
echo.
exit /b

endlocal 