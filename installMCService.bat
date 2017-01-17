@echo off
SETLOCAL

call setenvSnd.bat

@echo on
:checkJDK
if exist "%JAVA_HOME%/bin/javac.exe" goto installServiceMC
echo.
echo Javac wasn't found in directory %JAVA_HOME%/bin.
echo Please edit the setenv.bat script so that the JAVA_HOME
echo variable points to the root directory of your JDK installation.
goto finishMC

:installServiceMC
@echo on

:fin_install

"%SERVICE_NAME%.exe" -install %SERVICE_NAME% %JAVA_HOME%\jre\bin\server\jvm.dll -Xms%MEMORY%m -Xmx%MEMORY%m -Djava.class.path=%CLASSPATH% %OA_ARGS% -start fr.mma.openadaptor.adaptor.RunJMXManagedAdaptor -stop fr.mma.openadaptor.adaptor.RunJMXManagedAdaptor -method stop -out %ADAPTOR_HOME%\stdout.log -current %ADAPTOR_HOME% -path %PATH%

:finishRcv
ENDLOCAL