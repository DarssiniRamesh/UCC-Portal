@ECHO OFF
REM Windows shim for sass -> delegates to Node shim or build script
SETLOCAL
SET ROOT=%~dp0..
IF "%1"=="scss/index.scss" (
  IF "%2"=="css/index.css" (
    CALL bash "%ROOT%\scripts\build-css.sh"
    EXIT /B %ERRORLEVEL%
  )
)
CALL npx sass %*
EXIT /B %ERRORLEVEL%
