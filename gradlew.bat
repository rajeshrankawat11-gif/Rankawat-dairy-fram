@echo off
set GRADLE_VERSION=8.9
set CACHE=%USERPROFILE%\.gradle\rankawat-gradle
set DIST=%CACHE%\gradle-%GRADLE_VERSION%
if not exist "%DIST%\bin\gradle.bat" (
  echo Downloading Gradle %GRADLE_VERSION%...
  if not exist "%CACHE%" mkdir "%CACHE%"
  powershell -NoProfile -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%CACHE%\gradle-%GRADLE_VERSION%-bin.zip'"
  powershell -NoProfile -Command "Expand-Archive -Force '%CACHE%\gradle-%GRADLE_VERSION%-bin.zip' '%CACHE%'"
)
call "%DIST%\bin\gradle.bat" %*
