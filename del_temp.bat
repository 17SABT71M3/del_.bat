 @echo off
 set exdirec=
 set file_found=1
 set hidden_29831212982=false
 set str=%1
 if exist %str% (pushd %str% 2>NUL)
 set /a err_level=%errorlevel%
 popd
 if exist %str% if "%err_level%"=="0" (echo This is a directory.&goto :hehe)
 for /f "tokens=1,2 delims= " %%i in ('dir %str% 2^>NUL') do set exdirec=%%i %%j
 if "%exdirec%"=="0 Dir(s)" (set file_found=0)
 if %file_found%==0 echo File Found!&goto :next
 if "%file_found%" NEQ "0" for /f "tokens=1,2 delims= " %%i in ('dir /ah %str% 2^>NUL') do set exdirec=%%i %%j
 if NOT EXIST %str% echo. echo. >NUL& echo. ------^>%str%^<-------&echo. Please check&goto :eof
 if "%exdirec%"=="0 Dir(s)" (set file_found=0)
 if %file_found%==0 (echo File is Hidden,&goto :eof) else (goto :eof)
 :next
 if exist %str% for /f "delims=" %%i in ('dir /s /b /a-d %str% 2^>NUL') do call :delete "%%i"
 goto :hehe
 :delete
 del /p %1
 if not exist %1 echo.File Deleted.
 Exit /B
 :hehe
 popd
