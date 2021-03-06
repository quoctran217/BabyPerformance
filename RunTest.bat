@ECHO OFF

REM Set variables
SET SOURCE_DIR="F:\BabySharks\git\BabyPerformance"
SET THREAD=%1
SET RAMPUP=%2
SET DURATION=%3
SET CURRENT_DATETIME=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%.%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET JMX_Path="%SOURCE_DIR%\Perf_Training.jmx"
SET LOG_PATH="%SOURCE_DIR%\log\%CURRENT_DATETIME%_threads.%THREAD%.rampup.%RAMPUP%.duration.%DURATION%.csv"
SET HTMLREPORT_PATH="%SOURCE_DIR%\htmlreport"

REM Remove existing htmlreport directory
rmdir %HTMLREPORT_PATH% /s /q

REM Go to jmeter bin directory
cd /d %JMETER_HOME%\bin

REM Run load test and generate html report
jmeter -n -t %JMX_Path% -l %LOG_PATH% -e -o %HTMLREPORT_PATH% -Jthreads=%THREAD% -Jrampup=%RAMPUP% -Jduration=%DURATION%
::jmeter -g F:\BabySharks\git\BabyPerformance\log\merge_result2.csv -e -o %HTMLREPORT_PATH%