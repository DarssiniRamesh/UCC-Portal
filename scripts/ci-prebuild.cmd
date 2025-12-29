@ECHO OFF
REM Windows prebuild: ensure PATH and CSS presence
SETLOCAL
SET PATH=%CD%;%CD%\bin;%CD%\tools;%CD%\tools\bin;%CD%\node_modules\.bin;%CD%\css;%CD%\scss;%PATH%
CALL bash scripts/build-css.sh
ECHO [ci-prebuild.cmd] PATH configured and CSS ensured.
EXIT /B 0
