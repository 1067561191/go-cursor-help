# Auto-elevate to admin rights if not already running as admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Requesting administrator privileges..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Set TLS to 1.2 / 设置 TLS 为 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Colors for output / 输出颜色
$Red = "`e[31m"
$Green = "`e[32m"
$Blue = "`e[36m"
$Yellow = "`e[33m"
$Reset = "`e[0m"

# Messages / 消息
$EN_MESSAGES = @(
    "Starting installation...",
    "Detected architecture:",
    "Only 64-bit Windows is supported",
    "Latest version:",
    "Creating installation directory...",
    "Downloading latest release from:",
    "Failed to download binary:",
    "Downloaded file not found",
    "Installing binary...",
    "Failed to install binary:",
    "Adding to PATH...",
    "Cleaning up...",
    "Installation completed successfully!",
    "You can now use 'cursor-id-modifier' from any terminal (you may need to restart your terminal first)",
    "Checking for running Cursor instances...",
    "Found running Cursor processes. Attempting to close them...",
    "Successfully closed all Cursor instances",
    "Failed to close Cursor instances. Please close them manually",
    "Backing up storage.json...",
    "Backup created at:"
)

$CN_MESSAGES = @(
    "开始安装...",
    "检测到架构：",
    "仅支持64位Windows系统",
    "最新版本：",
    "正在创建安装目录...",
    "正在从以下地址下载最新版本：",
    "下载二进制文件失败：",
    "未找到下载的文件",
    "正在安装程序...",
    "安装二进制文件失败：",
    "正在添加到PATH...",
    "正在清理...",
    "安装成功完成！",
    "现在可以在任何终端中使用 'cursor-id-modifier' 了（可能需要重启终端）",
    "正在检查运行中的Cursor进程...",
    "发现正在运行的Cursor进程，尝试关闭...",
    "成功关闭所有Cursor实例",
    "无法关闭Cursor实例，请手动关闭",
    "正在备份storage.json...",
    "备份已创建于："
)

# Detect system language / 检测系统语言
function Get-SystemLanguage {
    if ((Get-Culture).Name -like "zh-CN") {
        return "cn"
    }
    return "en"
}

# Get message based on language / 根据语言获取消息
function Get-Message($Index) {
    $lang = Get-SystemLanguage
    if ($lang -eq "cn") {
        return $CN_MESSAGES[$Index]
    }
    return $EN_MESSAGES[$Index]
}

# Functions for colored output / 彩色输出函数
function Write-Status($Message) {
    Write-Host "${Blue}[*]${Reset} $Message"
}

function Write-Success($Message) {
    Write-Host "${Green}[✓]${Reset} $Message"
}

function Write-Warning($Message) {
    Write-Host "${Yellow}[!]${Reset} $Message"
}

function Write-Error($Message) {
    Write-Host "${Red}[✗]${Reset} $Message"
    Exit 1
}

# Close Cursor instances / 关闭Cursor实例
function Close-CursorInstances {
    Write-Status (Get-Message 14)
    $cursorProcesses = Get-Process "Cursor" -ErrorAction SilentlyContinue
    
    if ($cursorProcesses) {
        Write-Status (Get-Message 15)
        try {
            $cursorProcesses | ForEach-Object { $_.CloseMainWindow() | Out-Null }
            Start-Sleep -Seconds 2
            $cursorProcesses | Where-Object { !$_.HasExited } | Stop-Process -Force
            Write-Success (Get-Message 16)
        } catch {
            Write-Error (Get-Message 17)
        }
    }
}

# Backup storage.json / 备份storage.json
function Backup-StorageJson {
    Write-Status (Get-Message 18)
    $storageJsonPath = "$env:APPDATA\Cursor\User\globalStorage\storage.json"
    if (Test-Path $storageJsonPath) {
        $backupPath = "$storageJsonPath.backup"
        Copy-Item -Path $storageJsonPath -Destination $backupPath -Force
        Write-Success "$(Get-Message 19) $backupPath"
    }
}

# Get latest release version from GitHub / 从GitHub获取最新版本
function Get-LatestVersion {
    $repo = "yuaotian/go-cursor-help"
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest"
    return $release.tag_name
}

# Main installation process / 主安装过程
Write-Status (Get-Message 0)

# Close any running Cursor instances
Close-CursorInstances

# Backup storage.json
Backup-StorageJson

# Get system architecture / 获取系统架构
$arch = if ([Environment]::Is64BitOperatingSystem) { "amd64" } else { "386" }
Write-Status "$(Get-Message 1) $arch"

if ($arch -ne "amd64") {
    Write-Error (Get-Message 2)
}

# Get latest version / 获取最新版本
$version = Get-LatestVersion
Write-Status "$(Get-Message 3) $version"

# Set up paths / 设置路径
$installDir = "$env:ProgramFiles\cursor-id-modifier"
$binaryName = "cursor_id_modifier_${version}_windows_amd64.exe"
$downloadUrl = "https://github.com/yuaotian/go-cursor-help/releases/download/$version/$binaryName"
$tempFile = "$env:TEMP\$binaryName"

# Create installation directory / 创建安装目录
Write-Status (Get-Message 4)
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

# Download binary / 下载二进制文件
Write-Status "$(Get-Message 5) $downloadUrl"
try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile
} catch {
    Write-Error "$(Get-Message 6) $_"
}

# Verify download / 验证下载
if (-not (Test-Path $tempFile)) {
    Write-Error (Get-Message 7)
}

# Install binary / 安装二进制文件
Write-Status (Get-Message 8)
try {
    Move-Item -Force $tempFile "$installDir\cursor-id-modifier.exe"
} catch {
    Write-Error "$(Get-Message 9) $_"
}

# Add to PATH if not already present / 如果尚未添加则添加到PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$installDir*") {
    Write-Status (Get-Message 10)
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$userPath;$installDir",
        "User"
    )
}

# Create shortcut in Start Menu / 在开始菜单创建快捷方式
$startMenuPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\cursor-id-modifier.lnk"
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($startMenuPath)
$shortcut.TargetPath = "$installDir\cursor-id-modifier.exe"
$shortcut.Save()

# Cleanup / 清理
Write-Status (Get-Message 11)
if (Test-Path $tempFile) {
    Remove-Item -Force $tempFile
}

Write-Success (Get-Message 12)
Write-Success (Get-Message 13)
Write-Host ""