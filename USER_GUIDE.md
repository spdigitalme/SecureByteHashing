# Secure Byte Cryptographic Integrity Utility — User & Deployment Guide

> **Official Release Documentation**  
> Maintained by [@spdigitalme](https://github.com/spdigitalme) | Repository: [spdigitalme/SecureByteHashing](https://github.com/spdigitalme/SecureByteHashing)

---

## 1. Overview & Architecture

**Secure Byte Cryptographic Integrity Utility** is an enterprise-grade, 100% offline file integrity verification, cryptographic hashing, and directory comparison suite engineered for Windows 10 & 11 (x64).

### Key Technical Capabilities:
- **15 Cryptographic Engines**: SHA-256, SHA-512, SHA-384, SHA-224, SHA3 (224/256/384/512), BLAKE2B, BLAKE2S, BLAKE3 (AVX-512 SIMD accelerated), MD5, SHA-1, CRC32, CRC64.
- **Windows Explorer Cascading Context Menu**: Direct right-click integration on any file or group of files.
- **Real-Time Multi-File Calculation Popup**: Compute digests across multiple files simultaneously with instant clipboard copy and dynamic algorithm switching.
- **WiX Toolset Native Windows Installer (.msi)**: Standard `C:\Program Files\SecureByteHash` setup with Desktop & Start Menu shortcuts, system PATH registration, and clean uninstall.
- **Authenticode Digital Code Signing**: Fully signed binaries and installers with RFC 3161 timestamps.
- **100% Air-Gapped Privacy**: Zero internet network requests, zero telemetry, local CPU computation only.
- **Encrypted Local Storage**: SQLite3 database encrypted with AES-256-GCM.

---

## 2. Release Package Assets

All installer files are located in the **`Release v1.1.0`** directory:

| File | Description | Purpose |
| :--- | :--- | :--- |
| **`SecureByteHash-1.1.0-x64.msi`** | Standalone Windows Installer | Native setup wizard and uninstaller |
| **`SecureBytePublisher.cer`** | Public Authenticode Certificate | Establishes Windows OS trust for publisher |
| **`install_trust.bat`** | One-Click Trust Setup Tool | Installs `.cer` into Windows Root and TrustedPublisher stores |
| **`SHA256_checksum.txt`** | Cryptographic Hash Manifest | Verifies download integrity before running setup |

---

## 3. Step-by-Step Installation & Verification

### Step 3.1: Verify Download Integrity (SHA-256)
Before opening the installer, verify that your download has not been corrupted or tampered with:

```cmd
certutil -hashfile "Release v1.1.0\SecureByteHash-1.1.0-x64.msi" SHA256
```

Compare the 64-character hash output with the hash in `Release v1.1.0\SHA256_checksum.txt`. If they match, your installer is authentic.

---

### Step 3.2: Install Publisher Trust Certificate (Removes SmartScreen Warnings)

When you download an installer from the web, Windows automatically applies the **Mark-of-the-Web (`ZoneId=3`)**. Without pre-installed certificate trust, Microsoft Defender SmartScreen displays a blue block warning (*"Windows protected your PC"*).

To eliminate this warning and establish trusted publisher status:
1. Download `SecureBytePublisher.cer` and `install_trust.bat` from the release page into the same folder.
2. Right-click **`install_trust.bat`** and select **Run as administrator**.
3. The script silently adds the certificate to your local machine stores:
   - `LocalMachine\Root` (Trusted Root Certification Authorities)
   - `LocalMachine\TrustedPublisher` (Trusted Publishers)

Once trusted, Windows displays the trusted security dialog showing **`Publisher: Secure Byte Security Systems`** with a direct **Run** button!

#### Alternative Manual Command Prompt (Administrator):
```cmd
certutil -addstore -f "Root" SecureBytePublisher.cer
certutil -addstore -f "TrustedPublisher" SecureBytePublisher.cer
```

---

### Step 3.3: Running the WiX Setup Wizard

![WiX Setup Wizard](docs/images/wix_installer_wizard.png)

1. Double-click `SecureByteHash-1.1.0-x64.msi` to launch the Material Design 3 setup wizard.
2. Review and accept the End-User License Agreement.
3. Choose your destination directory (default: `C:\Program Files\SecureByteHash`).
4. Click **Install**. The wizard automatically:
   - Deploys compiled standalone binaries.
   - Registers system PATH environment variables.
   - Creates Desktop and Start Menu program shortcuts.
   - Registers Windows Explorer right-click cascading menus.
5. Click **Finish** to launch the utility.

#### Silent / Unattended Deployment (Enterprise / IT Admins):
```cmd
# Silent Install
msiexec /i SecureByteHash-1.1.0-x64.msi /qn

# Silent Install with custom directory
msiexec /i SecureByteHash-1.1.0-x64.msi /qn TARGETDIR="D:\Tools\SecureByteHash"

# Silent Uninstall
msiexec /x SecureByteHash-1.1.0-x64.msi /qn
```

---

## 4. How to Use the Utility

### 4.1 Windows Explorer Right-Click Menu & Multi-File Calculation

You can calculate checksums directly from Windows Explorer:
1. Select one or more files in Windows Explorer.
2. Right-click -> **Secure Byte Hashing** -> Choose algorithm (e.g. `SHA-256`, `SHA3-512`, `BLAKE3`).
3. The real-time multi-file processing popup opens immediately:

![Multi-File Checksum Popup](docs/images/popup_checksum_calculator.png)

- **Real-Time Progress**: Shows status, file name, file size, computed digest, and execution time per file.
- **Algorithm Switcher**: Switch algorithms instantly on the fly using the top dropdown.
- **One-Click Clipboard Actions**:
  - Click `Copy` on any row to copy that file's digest.
  - Click `Copy All` or `Copy Selected` at the bottom for bulk exports.
  - Click `Export...` to save results as CSV or TXT manifests.

---

### 4.2 Main Application Screen & Security Diagnostics

Launch the main utility from your Desktop or Start Menu:

![About Tab & Security Dashboard](docs/images/about_tab_preview.png)

- **File Integrity Tab**: Compare computed hashes against expected digests, identify file corruption, and inspect Shannon entropy.
- **Folder Tree Tab**: Recursively scan and diff directories with file-by-file status tracking (Match, Mismatch, Missing, Extra).
- **Text Tab**: Hash plaintext strings with custom encodings (UTF-8, ASCII, UTF-16).
- **Benchmark Suite**: Measure your CPU's hardware hashing throughput across AVX2, AVX-512, and OpenSSL hardware acceleration.
- **About Tab**:
  - Live system diagnostics and configuration metrics.
  - Developer Profile link to [@spdigitalme](https://github.com/spdigitalme).
  - Report Issue / Feedback link.

---

## 5. Troubleshooting & FAQ

#### Q: Why does Windows SmartScreen show "Unrecognized App"?
**A**: Because open-source self-contained releases do not use a commercial $400/yr certificate authority. Simply run `install_trust.bat` once as Administrator to trust the publisher certificate.

#### Q: Does Secure Byte send any data over the internet?
**A**: Absolutely not. The application is 100% offline and air-gapped. It does not open network sockets or send telemetry. All cryptographic processing occurs locally on your CPU.

#### Q: How do I clean uninstall?
**A**: Go to **Windows Settings -> Installed Apps -> Secure Byte Cryptographic Integrity Utility -> Uninstall**, or run:
```cmd
msiexec /x SecureByteHash-1.1.0-x64.msi /qn
```
The uninstaller cleanly deletes all program files, environment variables, shortcuts, and context menu registry entries.

---

## 6. Official Links & Community

- **Developer Profile**: [https://github.com/spdigitalme](https://github.com/spdigitalme)
- **Repository**: [https://github.com/spdigitalme/SecureByteHashing](https://github.com/spdigitalme/SecureByteHashing)
- **Issue Tracker**: [https://github.com/spdigitalme/SecureByteHashing/issues](https://github.com/spdigitalme/SecureByteHashing/issues)
