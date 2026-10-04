param([switch]$Force)

$ErrorActionPreference = 'Stop'
$pluginRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
$sourceDir = Join-Path $pluginRoot 'assets\pet'
$codexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
$targetDir = Join-Path $codexRoot 'pets\rice-eating-fat-fish'
$sourceJson = Join-Path $sourceDir 'pet.json'
$sourceSheet = Join-Path $sourceDir 'spritesheet.webp'
$targetJson = Join-Path $targetDir 'pet.json'
$targetSheet = Join-Path $targetDir 'spritesheet.webp'

if (-not (Test-Path -LiteralPath $sourceJson) -or -not (Test-Path -LiteralPath $sourceSheet)) {
    throw '插件内缺少宠物资源。'
}

if ((Test-Path -LiteralPath $targetDir) -and -not $Force) {
    $same = (Test-Path -LiteralPath $targetJson) -and (Test-Path -LiteralPath $targetSheet) -and
        ((Get-FileHash -Algorithm SHA256 -LiteralPath $sourceJson).Hash -eq (Get-FileHash -Algorithm SHA256 -LiteralPath $targetJson).Hash) -and
        ((Get-FileHash -Algorithm SHA256 -LiteralPath $sourceSheet).Hash -eq (Get-FileHash -Algorithm SHA256 -LiteralPath $targetSheet).Hash)
    if ($same) {
        Write-Output 'installed=true'
        Write-Output 'status=already-current'
        Write-Output 'spriteVersionNumber=2'
        Write-Output 'width=1536'
        Write-Output 'height=2288'
        exit 0
    }
    throw '目标目录已有不同版本。确认替换后使用 -Force。'
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item -LiteralPath $sourceJson -Destination $targetJson -Force
Copy-Item -LiteralPath $sourceSheet -Destination $targetSheet -Force

$manifest = Get-Content -Raw -Encoding UTF8 -LiteralPath $targetJson | ConvertFrom-Json
if ($manifest.spriteVersionNumber -ne 2 -or $manifest.displayName -ne '吃白饭的大肥鱼') {
    throw '安装后的 pet.json 校验失败。'
}

Write-Output 'installed=true'
Write-Output "path=$targetDir"
Write-Output 'spriteVersionNumber=2'
Write-Output 'width=1536'
Write-Output 'height=2288'
