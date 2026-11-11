<div align="center">

<img src="docs/images/logo.png" alt="Secure Byte Logo" width="130" />

# Secure Byte Cryptographic Integrity Utility

**Enterprise-grade, 100% offline file integrity verification, cryptographic hashing, and directory comparison engine for Windows.**

[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011%20(x64)-0078d4.svg?style=for-the-badge&logo=windows)](https://github.com/spdigitalme/SecureByteHashing)
[![Security: 100% Offline](https://img.shields.io/badge/Security-100%25%20Offline%20Air--Gapped-success.svg?style=for-the-badge&logo=shield)](https://github.com/spdigitalme/SecureByteHashing)
[![Signing: Authenticode](https://img.shields.io/badge/Authenticode-SHA--256%20Signed-green.svg?style=for-the-badge&logo=securityscorecard)](https://github.com/spdigitalme/SecureByteHashing)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Developer: spdigitalme](https://img.shields.io/badge/Developer-%40spdigitalme-6f42c1.svg?style=for-the-badge&logo=github)](https://github.com/spdigitalme)

[**📖 Comprehensive User Guide**](USER_GUIDE.md) • [**📦 Release v1.1.0 Package**](Release%20v1.1.0/) • [**⚖️ MIT License**](LICENSE) • [**👤 Developer Profile**](https://github.com/spdigitalme)

</div>

---

## 📑 Overview

**Secure Byte Cryptographic Integrity Utility** is a high-assurance, native Windows application designed for security professionals, system administrators, forensic analysts, and developers. Built from the ground up for strict offline air-gapped environments, it guarantees that **zero data, telemetry, or network requests** ever leave your workstation.

---

## ✨ Key Feature Highlights

<div align="center">

| Capability | Description |
| :--- | :--- |
| **15 Hash Engines** | Industry standard support: SHA-2, SHA-3 Keccak, BLAKE2/3, MD5, SHA-1, CRC32, and CRC64. |
| **Shell Integration** | Windows Explorer cascading right-click menus for instant single or multi-file checksum calculations. |
| **Multi-File Popup** | Parallel batch hashing with real-time progress, dynamic algorithm switching, and clipboard export. |
| **Directory Auditing** | Recursive dual-folder differential comparison matrix detecting Match, Mismatch, Missing, and Extra files. |
| **Hardware Acceleration** | Automatic CPU vectorization tier detection (AVX-512, AVX2, and OpenSSL hardware acceleration). |
| **Forensic Analysis** | Shannon entropy scoring (0.00–8.00 bits/byte) and executable binary overlay tamper detection. |
| **Encrypted Storage** | AES-256-GCM local authenticated SQLite3 database protecting threat blocklists and user preferences. |
| **Authenticode Signed** | Fully signed with SHA-256 Authenticode and RFC 3161 timestamps for verifiable authenticity. |

</div>

---

## 📸 Visual Tour & Workflows

### 1. Windows Explorer Cascading Menu & Multi-File Calculation Window
Select multiple files in Windows Explorer, right-click -> **Secure Byte Hashing** -> Choose algorithm. The dedicated batch window computes all digests concurrently with live millisecond timing and row-by-row clipboard copy actions:

<div align="center">
  <img src="docs/images/hash_popup_verified_window.png" alt="Multi-File Checksum Verification Window" width="94%" />
  <p><em>Real-Time Parallel Batch Hashing Window (SHA3-512 with per-file status badges, sizes, execution times, and instant row copy)</em></p>
</div>

---

### 2. Primary File Checksum & Forensic Integrity Suite
Drag and drop target files into the inspection drop zone to calculate multi-algorithm hashes simultaneously, verify expected checksums, detect appended binary overlays, and measure Shannon entropy:

<div align="center">
  <img src="docs/images/main_window_file_tab.png" alt="File Checksum Verification Dashboard" width="94%" />
  <p><em>Primary File Checksum Inspection Dashboard with Drag & Drop Zone, Hardware Acceleration Badge, and Multi-Digest Outputs</em></p>
</div>

---

### 3. Native WiX Setup Wizard (Material Design 3)
Clean 64-bit Windows Installer deploying to `C:\Program Files\SecureByteHash` with desktop shortcuts, system PATH registration, and standard Control Panel uninstallation:

<div align="center">
  <img src="docs/images/wix_installer_wizard.png" alt="WiX Setup Wizard" width="72%" />
  <p><em>Material Design 3 High-DPI Supersampled Setup Wizard</em></p>
</div>

---

### 4. Verified Publisher Security Dialog (SmartScreen Bypass)
By importing the public certificate via `install_trust.bat`, Windows recognizes **`Publisher: Secure Byte Security Systems`** as trusted, replacing the blue SmartScreen warning with a clean, trusted execution prompt:

<div align="center">
  <img src="docs/images/windows_security_trusted_publisher.png" alt="Trusted Publisher Security Warning" width="60%" />
  <p><em>Trusted Windows Security Dialog with Verified Publisher Identity and Direct Run Action</em></p>
</div>

---

### 5. Recursive Directory Tree Auditing & Differential Comparison
Compare two directories recursively to identify identical files, altered files, missing records, or unrecorded files with filtered views and CSV audit exports:

<div align="center">
  <img src="docs/images/main_window_folder_tab.png" alt="Directory Tree Auditing" width="94%" />
  <p><em>Dual-Directory Inspection Matrix with Status Badges (Matches, Mismatches, Missing, Extra) and CSV Export</em></p>
</div>

---

### 6. Preferences, Cryptographic Salting & Offline Threat Intel
Configure default active hash engines, streaming buffer sizes, process priority classes, cryptographic salt keys, RFC 2104 HMAC secret keys, and offline malware signature blocklists:

<div align="center">
  <img src="docs/images/main_window_options_tab.png" alt="Application Preferences" width="94%" />
  <p><em>Preferences Tab: Workflow Automation, Algorithm Selection, Threat Intel DB, and Performance Tuning</em></p>
</div>

---

### 7. System Diagnostics & Developer Profile
Live CPU instruction tier telemetry, bundled typography verification (Roboto & JetBrains Mono), diagnostics clipboard report, and developer profile links:

<div align="center">
  <img src="docs/images/about_tab_preview.png" alt="System Diagnostics and Developer Profile" width="94%" />
  <p><em>About Tab: Live System Diagnostics Metrics, Air-Gapped Status, and Developer Profile (@spdigitalme)</em></p>
</div>

---

## 📦 Release Package Contents

All production installer files are self-contained in the [**`Release v1.1.0/`**](Release%20v1.1.0/) folder:

| File Name | Format | Size | Description |
| :--- | :--- | :--- | :--- |
| **[`SecureByteHash-1.1.0-x64.msi`](Release%20v1.1.0/SecureByteHash-1.1.0-x64.msi)** | Windows Installer | `45.4 MB` | Standalone native 64-bit installer with setup wizard and clean uninstaller. |
| **[`SecureBytePublisher.cer`](Release%20v1.1.0/SecureBytePublisher.cer)** | X.509 Certificate | `1.0 KB` | Public Authenticode publisher certificate used to verify binary integrity. |
| **[`install_trust.bat`](Release%20v1.1.0/install_trust.bat)** | Batch Utility | `2.2 KB` | One-click Administrator setup tool to install certificate trust into Windows stores. |
| **[`SHA256_checksum.txt`](Release%20v1.1.0/SHA256_checksum.txt)** | Checksum File | `64 B` | SHA-256 cryptographic digest of the official `.msi` package. |

---

## 🚀 Quick Installation Guide

### Step 1: Install Publisher Trust Certificate (One-Click)
> [!TIP]
> Running `install_trust.bat` registers the public certificate into your Windows Certificate Store, which eliminates Microsoft Defender SmartScreen blocks and displays the verified **Publisher** dialog shown above.

1. Navigate to the **`Release v1.1.0`** directory.
2. Right-click **`install_trust.bat`** and select **Run as administrator**.
   *(Silently registers `SecureBytePublisher.cer` into Windows `Root` and `TrustedPublisher` stores)*

### Step 2: Verify Package Integrity (SHA-256)
Open Command Prompt and verify the installer digest before execution:
```cmd
certutil -hashfile "Release v1.1.0\SecureByteHash-1.1.0-x64.msi" SHA256
```
Confirm the output matches the official hash in `Release v1.1.0\SHA256_checksum.txt`:
```
87e52b7cb2070b3d2deb5bce7d2bf86e09595b7a8740cfdf00c6af3db78dcf92
```

### Step 3: Run the Installer
Double-click **`SecureByteHash-1.1.0-x64.msi`** to start the setup wizard, or run via Command Prompt:
```cmd
# Standard Interactive GUI Setup
msiexec /i "Release v1.1.0\SecureByteHash-1.1.0-x64.msi"

# Silent Unattended Deployment (Enterprise / Systems Admins)
msiexec /i "Release v1.1.0\SecureByteHash-1.1.0-x64.msi" /qn

# Silent Clean Uninstallation
msiexec /x "Release v1.1.0\SecureByteHash-1.1.0-x64.msi" /qn
```

---

## 🗂️ Supported Cryptographic Algorithms

<div align="center">

| Algorithm Family | Engines Supported | Output Size | Standards & Standards |
| :--- | :--- | :--- | :--- |
| **SHA-2** | SHA-224, SHA-256, SHA-384, SHA-512 | 224 - 512 bits | FIPS 180-4 standard, industry baseline for PKI & digital signatures |
| **SHA-3 (Keccak)** | SHA3-224, SHA3-256, SHA3-384, SHA3-512 | 224 - 512 bits | FIPS 202 standard, permutation-based sponge construction |
| **BLAKE Family** | BLAKE2B, BLAKE2S, BLAKE3 | 256 - 512 bits | Tree-hashing, AVX-512 SIMD accelerated, ultra-high throughput |
| **Checksum Engines** | CRC32, CRC64 | 32 - 64 bits | IEEE 802.3 and ECMA-182 standards for high-speed transmission verification |
| **Legacy Engines** | MD5, SHA-1 | 128 - 160 bits | Backward compatibility for legacy forensic auditing and SFV manifests |

</div>

---

## 📚 Documentation & License

- **Complete Operational Walkthrough**: See [**`USER_GUIDE.md`**](USER_GUIDE.md) for full step-by-step instructions.
- **License**: Released under the [**MIT License**](LICENSE).

---

## 👨‍💻 Developer & Maintenance

- **Developer Profile**: [@spdigitalme](https://github.com/spdigitalme)
- **Repository**: [spdigitalme/SecureByteHashing](https://github.com/spdigitalme/SecureByteHashing)
- **Feedback & Issues**: [GitHub Issues](https://github.com/spdigitalme/SecureByteHashing/issues)

<div align="center">
<sub>Secure Byte Cryptographic Integrity Utility • Enterprise 100% Offline Air-Gapped Verification</sub>
</div>
