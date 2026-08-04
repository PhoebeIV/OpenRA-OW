@echo off
title OpenRA-OW Make Release
cd /d "%~dp0"

where dotnet >nul 2>nul || (echo .NET SDK 10 not found. Install from https://dotnet.microsoft.com/download/dotnet/10.0 & pause & exit /b 1)

set "BASH="
if exist "%ProgramFiles%\Git\bin\bash.exe" set "BASH=%ProgramFiles%\Git\bin\bash.exe"
if exist "%ProgramFiles(x86)%\Git\bin\bash.exe" set "BASH=%ProgramFiles(x86)%\Git\bin\bash.exe"
if not defined BASH for /f "delims=" %%i in ('where bash 2^>nul') do if not defined BASH set "BASH=%%i"
if not defined BASH (echo Git Bash is required. Install Git for Windows from https://git-scm.com/ & pause & exit /b 1)

"%BASH%" make-release.sh %*
if errorlevel 1 pause
