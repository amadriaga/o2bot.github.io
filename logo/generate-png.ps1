#!/usr/bin/env pwsh
# Generate PNG files from SVG logos
# Requires Inkscape to be installed

param(
    [string]$InputSvg = "humberstack_v1.0_helvetica_neue_text_master.svg",
    [switch]$All = $false,
    [switch]$Icon = $false
)

$ErrorActionPreference = "Stop"

# Check if Inkscape is installed
$inkscape = Get-Command inkscape -ErrorAction SilentlyContinue
if (-not $inkscape) {
    Write-Host "❌ Inkscape not found. Please install it first:" -ForegroundColor Red
    Write-Host ""
    Write-Host "Windows: choco install inkscape" -ForegroundColor Yellow
    Write-Host "   or download from: https://inkscape.org/release/" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Mac: brew install inkscape" -ForegroundColor Yellow
    exit 1
}

Write-Host "🎨 Generating PNG files from $InputSvg..." -ForegroundColor Cyan

# Use icon version for square exports if specified
if ($Icon) {
    $InputSvg = "humberstack_icon_v1.0_master.svg"
    Write-Host "Using icon version for square exports" -ForegroundColor Yellow
}

# Create output directory
$outputDir = "png"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Favicon sizes
$faviconSizes = @(16, 32, 48, 64, 128)
Write-Host "`n📱 Generating favicon sizes..." -ForegroundColor Green
foreach ($size in $faviconSizes) {
    $output = Join-Path $outputDir "favicon-${size}x${size}.png"
    Write-Host "  → ${size}x${size}px" -ForegroundColor Gray
    inkscape $InputSvg -w $size -h $size -o $output 2>$null
}

# PWA/App icon sizes
$appSizes = @(192, 512)
Write-Host "`n📦 Generating PWA/app icon sizes..." -ForegroundColor Green
foreach ($size in $appSizes) {
    $output = Join-Path $outputDir "icon-${size}x${size}.png"
    Write-Host "  → ${size}x${size}px" -ForegroundColor Gray
    inkscape $InputSvg -w $size -h $size -o $output 2>$null
}

# Apple touch icon
Write-Host "`n🍎 Generating Apple touch icon..." -ForegroundColor Green
$appleIcon = Join-Path $outputDir "apple-touch-icon.png"
Write-Host "  → 180x180px" -ForegroundColor Gray
inkscape $InputSvg -w 180 -h 180 -o $appleIcon 2>$null

# High resolution for general use
if ($All) {
    Write-Host "`n🖼️  Generating high-resolution exports..." -ForegroundColor Green
    $highResSizes = @(256, 512, 1024)
    foreach ($size in $highResSizes) {
        $output = Join-Path $outputDir "logo-${size}x${size}.png"
        Write-Host "  → ${size}x${size}px" -ForegroundColor Gray
        inkscape $InputSvg -w $size -h $size -o $output 2>$null
    }
}

# Generate ICO file (Windows)
Write-Host "`n💻 Generating favicon.ico..." -ForegroundColor Green
$icoSizes = @(16, 32, 48)
$icoFiles = @()
foreach ($size in $icoSizes) {
    $icoFiles += Join-Path $outputDir "favicon-${size}x${size}.png"
}

# Try to create .ico file using PowerShell
# Note: This requires additional tools or manual conversion
Write-Host "  → Convert manually or use online tool for .ico" -ForegroundColor Yellow
Write-Host "     Recommended: https://www.icoconverter.com/" -ForegroundColor Yellow

Write-Host "`n✅ PNG generation complete!" -ForegroundColor Green
Write-Host "📁 Files saved to: $outputDir" -ForegroundColor Cyan

# Summary
Write-Host "`n📊 Summary:" -ForegroundColor Cyan
$pngFiles = Get-ChildItem -Path $outputDir -Filter "*.png"
Write-Host "   Generated $($pngFiles.Count) PNG files" -ForegroundColor White

Write-Host "`n💡 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Copy PNG files to ../humberstack/logo/" -ForegroundColor White
Write-Host "   2. Update HTML with favicon links" -ForegroundColor White
Write-Host "   3. Create manifest.json for PWA" -ForegroundColor White
