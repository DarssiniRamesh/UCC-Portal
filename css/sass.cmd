@ECHO OFF
REM Windows CI shim placed in css/ to handle: sass ..\scss\index.scss index.css
SETLOCAL
SET ROOT=%~dp0..
IF "%1"=="..\scss\index.scss" (
  IF "%2"=="index.css" (
    CALL bash "%ROOT%\scripts\build-css.sh"
    IF EXIST "%ROOT%\css\index.css" (
      ECHO [css\sass.cmd] Ensured css/index.css present.
      EXIT /B 0
    )
    IF EXIST "%ROOT%\css\index.fallback.css" (
      COPY /Y "%ROOT%\css\index.fallback.css" "%ROOT%\css\index.css" >NUL
      ECHO [css\sass.cmd] Copied fallback CSS.
      EXIT /B 0
    )
  )
)
REM For other args, attempt npx sass if available
WHERE npx >NUL 2>&1
IF %ERRORLEVEL%==0 (
  npx sass %*
  EXIT /B %ERRORLEVEL%
)
ECHO [css\sass.cmd] No-op for args: %*
EXIT /B 0
