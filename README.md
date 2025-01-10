# 🚀 Cursor Free Trial Reset Tool

<div align="center">

[![Release](https://img.shields.io/github/v/release/yuaotian/go-cursor-help?style=flat-square&logo=github&color=blue)](https://github.com/yuaotian/go-cursor-help/releases/latest)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square&logo=bookstack)](https://github.com/yuaotian/go-cursor-help/blob/master/LICENSE)
[![Stars](https://img.shields.io/github/stars/yuaotian/go-cursor-help?style=flat-square&logo=github)](https://github.com/yuaotian/go-cursor-help/stargazers)

[🌟 English](#english) | [🌏 中文](#chinese)

<img src="https://ai-cursor.com/wp-content/uploads/2024/09/logo-cursor-ai-png.webp" alt="Cursor Logo" width="120"/>

</div>

---

## 🌟 English

### 📝 Description

> Resets Cursor's free trial limitation when you see:

```text
Too many free trial accounts used on this machine.
Please upgrade to pro. We have this limit in place
to prevent abuse. Please let us know if you believe
this is a mistake.
```

> If you see this message:
```text
You've reached your trial request limit.
```
> This means you've reached the usage limit during the VIP free trial period. Solutions:
> - Log out and register a new account
> - Switch to a different account

### 💻 System Support

<table>
<tr>
<td>

**Windows** ✅
- x64 (64-bit)
- x86 (32-bit)

</td>
<td>

**macOS** ✅
- Intel (x64)
- Apple Silicon (M1/M2)

</td>
<td>

**Linux** ✅
- x64 (64-bit)
- x86 (32-bit)
- ARM64

</td>
</tr>
</table>

### 🚀 One-Click Solution

**Linux/macOS**: Copy and paste in terminal
```bash
curl -fsSL https://raw.githubusercontent.com/yuaotian/go-cursor-help/master/scripts/install.sh | sudo bash
```
**国内Linux/macOS用户代理下载执行**
- **macOS**:
```bash
curl -fsSL https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_mac_id_modifier.sh | sudo bash
```
- **Linux**:
```bash
curl -fsSL https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_linux_id_modifier.sh | sudo bash
```

**Windows**: Copy and paste in PowerShell
```powershell
irm https://raw.githubusercontent.com/yuaotian/go-cursor-help/master/scripts/install.ps1 | iex
```
**国内用户快速安装**
```powershell
irm  https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_win_id_modifier.ps1 | iex
```
[Administrator Terminal Guide(English)](#admin-terminal-en) |[管理员终端说明(中文)](#admin-terminal-zh)
### 💻 How to Open Windows Administrator Terminal {#admin-terminal-en}

> **Steps to open administrator terminal on Windows:**
> 1. Use shortcut key `Win + X`
> 2. Select from the popup menu:
>    - "Windows PowerShell (Administrator)"
>    - "Windows Terminal (Administrator)" 
>    - "Terminal (Administrator)"
>    (Options may vary depending on your Windows version)

#### Windows Installation Features:
- 🔍 Automatically detects and uses PowerShell 7 if available
- 🛡️ Requests administrator privileges via UAC prompt
- 📝 Falls back to Windows PowerShell if PS7 isn't found
- 💡 Provides manual instructions if elevation fails

That's it! The script will:
1. ✨ Install the tool automatically
2. 🔄 Reset your Cursor trial immediately

### 📦 Manual Installation

> Download the appropriate file for your system from [releases](https://github.com/yuaotian/go-cursor-help/releases/latest)

<details>
<summary>Windows Packages</summary>

- 64-bit: `cursor-id-modifier_windows_x64.exe`
- 32-bit: `cursor-id-modifier_windows_x86.exe`
</details>

<details>
<summary>macOS Packages</summary>

- Intel: `cursor-id-modifier_darwin_x64_intel`
- M1/M2: `cursor-id-modifier_darwin_arm64_apple_silicon`
</details>

<details>
<summary>Linux Packages</summary>

- 64-bit: `cursor-id-modifier_linux_x64`
- 32-bit: `cursor-id-modifier_linux_x86`
- ARM64: `cursor-id-modifier_linux_arm64`
</details>

### 🔧 Technical Details

<details>
<summary><b>Configuration Files</b></summary>

The program modifies Cursor's `storage.json` config file located at:

- Windows: `%APPDATA%\Cursor\User\globalStorage\storage.json`
- macOS: `~/Library/Application Support/Cursor/User/globalStorage/storage.json`
- Linux: `~/.config/Cursor/User/globalStorage/storage.json`
</details>

<details>
<summary><b>Modified Fields</b></summary>

The tool generates new unique identifiers for:
- `telemetry.machineId`
- `telemetry.macMachineId`
- `telemetry.devDeviceId`
- `telemetry.sqmId`
</details>

<details>
<summary><b>Safety Features</b></summary>

- ✅ Safe process termination
- ✅ Atomic file operations
- ✅ Error handling and recovery
</details>

---

## 🌏 Chinese

### 📝 问题描述

> 当看到以下提示时重置Cursor试用期：

```text
Too many free trial accounts used on this machine.
Please upgrade to pro. We have this limit in place
to prevent abuse. Please let us know if you believe
this is a mistake.
```

> 如果看到以下提示：
```text
You've reached your trial request limit.
```
> 这表示在VIP免费试用期间已达到使用次数限制。解决方案：
> - 注销当前账号并重新注册
> - 更换新的账号

## 联系方式

<div align="center">
<table>
<tr>
<td align="center">
<b>个人微信</b><br>
<img src="img/wx_me.png" width="250" alt="作者微信"><br>
<b>微信：JavaRookie666</b>
</td>
<td align="center">
<b>微信交流群</b><br>
<img src="img/wx_group.png" width="250" alt="微信群二维码"><br>
<small>7天内(1月15日前)有效，群满可以加公众号关注最新动态</small>
</td>
<td align="center">
<b>公众号</b><br>
<img src="img/wx_public_2.png" width="250" alt="微信公众号"><br>
<small>获取更多AI开发资源</small>
</td>
<td align="center">
<b>微信赞赏</b><br>
<img src="img/wx_zsm2.png" width="300" alt="微信赞赏码"><br>
<small>要到饭咧？啊咧？啊咧？不给也没事~ 请随意打赏</small>
</td>
<td align="center">
<b>支付宝赞赏</b><br>
<img src="img/alipay.png" width="300" alt="支付宝赞赏码"><br>
<small>如果觉得有帮助,来包辣条犒劳一下吧~</small>
</td>
</tr>
</table>
</div>

### 🚀 系统支持

<table>
<tr>
<td>

**Windows** ✅
- x64 & x86

</td>
<td>

**macOS** ✅
- Intel & M-series

</td>
<td>

**Linux** ✅
- x64 & ARM64

</td>
</tr>
</table>

### 🚀 一键解决

**Linux/macOS**: 在终端中复制粘贴
```bash
curl -fsSL https://raw.githubusercontent.com/yuaotian/go-cursor-help/master/scripts/install.sh | sudo bash
```
**国内Linux/macOS用户代理下载执行**
- **macOS**:
```bash
curl -fsSL https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_mac_id_modifier.sh | sudo bash
```
- **Linux**:
```bash
curl -fsSL https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_linux_id_modifier.sh | sudo bash
```

**Windows**: 在PowerShell中复制粘贴执行
```powershell
irm https://raw.githubusercontent.com/yuaotian/go-cursor-help/master/scripts/install.ps1 | iex
```
**国内用户快速安装**
```powershell
irm  https://aizaozao.com/accelerate.php/https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_win_id_modifier.ps1 | iex
```

 [管理员终端说明(中文)](#admin-terminal-zh)|[Administrator Terminal Guide(English)](#admin-terminal-en)
### 💻 如何打开Windows管理员终端 {#admin-terminal-zh}

> **Windows系统打开管理员终端的方法：**
> 1. 使用快捷键 `Win + X`
> 2. 在弹出的菜单中选择:
>    - "Windows PowerShell (管理员)" 
>    - "Windows Terminal (管理员)"
>    - "终端(管理员)"
>    (根据系统版本可能显示不同选项)

#### Windows 安装特性:
- 🔍 自动检测并使用 PowerShell 7（如果可用）
- 🛡️ 通过 UAC 提示请求管理员权限
- 📝 如果没有 PS7 则使用 Windows PowerShell
- 💡 如果提权失败会提供手动说明

That's it! The script will:
1. ✨ 自动安装工具
2. 🔄 立即重置Cursor试用期

### 📦 Manual Installation

> Download the appropriate file for your system from [releases](https://github.com/yuaotian/go-cursor-help/releases/latest)

<details>
<summary>Windows Packages</summary>

- 64-bit: `cursor-id-modifier_windows_x64.exe`
- 32-bit: `cursor-id-modifier_windows_x86.exe`
</details>

<details>
<summary>macOS Packages</summary>

- Intel: `cursor-id-modifier_darwin_x64_intel`
- M1/M2: `cursor-id-modifier_darwin_arm64_apple_silicon`
</details>

<details>
<summary>Linux Packages</summary>

- 64-bit: `cursor-id-modifier_linux_x64`
- 32-bit: `cursor-id-modifier_linux_x86`
- ARM64: `cursor-id-modifier_linux_arm64`
</details>

### 🔧 技术细节

<details>
<summary><b>配置文件</b></summary>

程序修改Cursor的`storage.json`配置文件，位于：

- Windows: `%APPDATA%\Cursor\User\globalStorage\`
- macOS: `~/Library/Application Support/Cursor/User/globalStorage/`
- Linux: `~/.config/Cursor/User/globalStorage/`
</details>

<details>
<summary><b>修改字段</b></summary>

工具会生成新的唯一标识符：
- `telemetry.machineId`
- `telemetry.macMachineId`
- `telemetry.devDeviceId`
- `telemetry.sqmId`
</details>

<details>
<summary><b>安全特性</b></summary>


  
---

## ⭐ Project Stats

<div align="center">

[![Star History Chart](https://api.star-history.com/svg?repos=yuaotian/go-cursor-help&type=Date)](https://star-history.com/#yuaotian/go-cursor-help&Date)

![Repobeats analytics image](https://repobeats.axiom.co/api/embed/ddaa9df9a94b0029ec3fad399e1c1c4e75755477.svg "Repobeats analytics image")

</div>

## 📄 License

<details>
<summary><b>MIT License</b></summary>

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
</details>
