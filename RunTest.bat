@ECHO OFF

REM Set variables
SET SOURCE_DIR="D:\Projects\Baby_Shark\perf\BabyPerformance"
SET CURRENT_DATETIME=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%.%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET JMX_Path="%SOURCE_DIR%\Perf_Training.jmx"
SET LOG_PATH="%SOURCE_DIR%\log\log_%CURRENT_DATETIME%.xml"
SET HTMLREPORT_PATH="%SOURCE_DIR%\htmlreport"

REM Remove existing htmlreport directory
rmdir %HTMLREPORT_PATH% /s /q

REM Go to jmeter bin directory
cd %JMETER_HOME%\bin

REM Run load test and generate html report
jmeter -n -t %JMX_Path% -l %LOG_PATH% -e -o %HTMLREPORT_PATH% -Jduration=%1