@echo off
setlocal EnableDelayedExpansion

title Secure Byte - Install Publisher Trust Certificate

echo ======================================================================
echo  Secure Byte Cryptographic Systems - Authenticode Certificate Setup
echo ======================================================================
echo.
echo Installing SecureBytePublisher.cer into Windows LocalMachine Stores:
echo  1. Root (Trusted Root Certification Authorities)
echo  2. TrustedPublisher (Trusted Publishers)
echo.
echo This eliminates Windows Defender SmartScreen blocks and displays
echo "Publisher: Secure Byte Security Systems" on installer files.
echo.

:: Check for Administrator elevation
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [REQUESTING ADMIN PRIVILEGES]
    echo Administrator rights are required to install LocalMachine certificates.
    powershell -Command "Start-Process cmd -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

set "CER_PATH=%~dp0SecureBytePublisher.cer"
if not exist "%CER_PATH%" (
    echo [ERROR] Certificate file not found: "%CER_PATH%"
    pause
    exit /b 1
)

echo [1/2] Adding certificate to Root store...
certutil -addstore -f "Root" "%CER_PATH%" >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] Trusted Root Certification Authorities store updated.
) else (
    echo       [WARN] Root store update returned status code: %errorlevel%
)

echo [2/2] Adding certificate to TrustedPublisher store...
certutil -addstore -f "TrustedPublisher" "%CER_PATH%" >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] Trusted Publishers store updated.
) else (
    echo       [WARN] TrustedPublisher store update returned status code: %errorlevel%
)

echo.
echo ======================================================================
echo  Verification & Trust Status
echo ======================================================================
certutil -verifystore "Root" "Secure Byte Security Systems" >nul 2>&1
if %errorlevel% equ 0 (
    echo  STATUS: [VERIFIED] Publisher certificate is active and trusted!
    echo  You can now run SecureByteHash-1.1.0-x64.msi cleanly.
) else (
    echo  STATUS: Certificate imported.
)
echo ======================================================================
echo.
pause
