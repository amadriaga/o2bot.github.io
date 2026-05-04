# HumberStack Logo - Image Export Script for Website
# Generates images in various sizes for web deployment

Write-Host "HumberStack Logo - Website Image Generator" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Check for Inkscape
$inkscapePath = "C:\Program Files\Inkscape\bin\inkscape.exe"
if (-not (Test-Path $inkscapePath)) {
    Write-Host "[ERROR] Inkscape not found at: $inkscapePath" -ForegroundColor Red
    exit 1
}

Write-Host "[OK] Found Inkscape" -ForegroundColor Green
Write-Host ""

# Create output directory
$outputDir = "website-images"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "[OK] Created output directory: $outputDir" -ForegroundColor Green
} else {
    Write-Host "[OK] Using existing directory: $outputDir" -ForegroundColor Green
}
Write-Host ""

# Source file
$sourceFile = "humberstack_v3.0_production_master.svg"
$sourceWhite = "humberstack_v3.0_white_production_master.svg"

if (-not (Test-Path $sourceFile)) {
    Write-Host "[ERROR] Source file not found: $sourceFile" -ForegroundColor Red
    exit 1
}

# Export configurations
$exports = @(
    # Favicons
    @{Name="favicon-16x16.png"; Width=16; Height=16; Desc="Favicon 16px"},
    @{Name="favicon-32x32.png"; Width=32; Height=32; Desc="Favicon 32px"},
    @{Name="favicon-48x48.png"; Width=48; Height=48; Desc="Favicon 48px"},
    
    # Apple Touch Icons
    @{Name="apple-touch-icon-180x180.png"; Width=180; Height=180; Desc="Apple Touch Icon"},
    
    # Android/Chrome
    @{Name="android-chrome-192x192.png"; Width=192; Height=192; Desc="Android Chrome 192px"},
    @{Name="android-chrome-512x512.png"; Width=512; Height=512; Desc="Android Chrome 512px"},
    
    # Website logos (various sizes)
    @{Name="logo-small.png"; Width=150; Height=150; Desc="Small logo"},
    @{Name="logo-medium.png"; Width=300; Height=300; Desc="Medium logo"},
    @{Name="logo-large.png"; Width=600; Height=600; Desc="Large logo"},
    
    # Social media
    @{Name="og-image.png"; Width=1200; Height=630; Desc="Open Graph image"},
    
    # High resolution
    @{Name="logo-hires.png"; Width=2048; Height=2048; Desc="High resolution"}
)

Write-Host "Exporting PNG images..." -ForegroundColor Yellow
Write-Host ""

$successCount = 0
$failCount = 0

foreach ($export in $exports) {
    $outputPath = Join-Path $outputDir $export.Name
    
    Write-Host "  Exporting: $($export.Desc)" -ForegroundColor Gray
    Write-Host "    Size: $($export.Width)x$($export.Height)" -ForegroundColor DarkGray
    
    # Use Inkscape to export
    $arguments = @(
        $sourceFile,
        "--export-filename=$outputPath",
        "--export-width=$($export.Width)",
        "--export-height=$($export.Height)",
        "--export-background-opacity=0"
    )
    
    $process = Start-Process -FilePath $inkscapePath -ArgumentList $arguments -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputPath)) {
        $size = [math]::Round((Get-Item $outputPath).Length / 1KB, 2)
        Write-Host "    [SUCCESS] $($export.Name) - $size KB" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host "    [FAIL] Failed to export $($export.Name)" -ForegroundColor Red
        $failCount++
    }
    Write-Host ""
}

# Export white version for dark backgrounds
Write-Host "Exporting white logo version..." -ForegroundColor Yellow
Write-Host ""

$whiteExports = @(
    @{Name="logo-white-small.png"; Width=150; Height=150; Desc="White logo small"},
    @{Name="logo-white-medium.png"; Width=300; Height=300; Desc="White logo medium"},
    @{Name="logo-white-large.png"; Width=600; Height=600; Desc="White logo large"}
)

foreach ($export in $whiteExports) {
    $outputPath = Join-Path $outputDir $export.Name
    
    Write-Host "  Exporting: $($export.Desc)" -ForegroundColor Gray
    Write-Host "    Size: $($export.Width)x$($export.Height)" -ForegroundColor DarkGray
    
    $arguments = @(
        $sourceWhite,
        "--export-filename=$outputPath",
        "--export-width=$($export.Width)",
        "--export-height=$($export.Height)",
        "--export-background-opacity=0"
    )
    
    $process = Start-Process -FilePath $inkscapePath -ArgumentList $arguments -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputPath)) {
        $size = [math]::Round((Get-Item $outputPath).Length / 1KB, 2)
        Write-Host "    [SUCCESS] $($export.Name) - $size KB" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host "    [FAIL] Failed to export $($export.Name)" -ForegroundColor Red
        $failCount++
    }
    Write-Host ""
}

Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "Export Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Summary:" -ForegroundColor Yellow
Write-Host "  Success: $successCount" -ForegroundColor Green
Write-Host "  Failed: $failCount" -ForegroundColor $(if ($failCount -gt 0) { "Red" } else { "Gray" })
Write-Host "  Output directory: $outputDir" -ForegroundColor White
Write-Host ""

# Calculate total size
$totalSize = 0
Get-ChildItem $outputDir -Filter "*.png" | ForEach-Object {
    $totalSize += $_.Length
}
$totalSizeMB = [math]::Round($totalSize / 1MB, 2)

Write-Host "Total size: $totalSizeMB MB" -ForegroundColor White
Write-Host ""
Write-Host "Note: Convert PNG to WebP using: https://squoosh.app or cwebp tool" -ForegroundColor Cyan
Write-Host "Ready for website deployment!" -ForegroundColor Green
