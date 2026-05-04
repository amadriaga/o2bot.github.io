# HumberStack Logo - PNG to WebP Converter
# Converts all PNG images to WebP format for better web performance

$cwebpPath = "$env:LOCALAPPDATA\libwebp\libwebp-1.3.2-windows-x64\bin\cwebp.exe"

Write-Host "HumberStack Logo - WebP Converter" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $cwebpPath)) {
    Write-Host "[ERROR] cwebp not found at: $cwebpPath" -ForegroundColor Red
    Write-Host "Please run the install script first." -ForegroundColor Yellow
    exit 1
}

Write-Host "[OK] Found cwebp" -ForegroundColor Green
Write-Host ""

$inputDir = "website-images"
$outputDir = "website-images-webp"

if (-not (Test-Path $inputDir)) {
    Write-Host "[ERROR] Input directory not found: $inputDir" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "[OK] Created output directory: $outputDir" -ForegroundColor Green
} else {
    Write-Host "[OK] Using existing directory: $outputDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "Converting PNG to WebP..." -ForegroundColor Yellow
Write-Host ""

$pngFiles = Get-ChildItem -Path $inputDir -Filter "*.png"
$successCount = 0
$failCount = 0

foreach ($pngFile in $pngFiles) {
    $inputPath = $pngFile.FullName
    $outputPath = Join-Path $outputDir ($pngFile.BaseName + ".webp")
    
    Write-Host "  Converting: $($pngFile.Name)" -ForegroundColor Gray
    
    # Convert with quality 90, alpha channel preserved
    $process = Start-Process -FilePath $cwebpPath -ArgumentList @(
        "-q", "90",
        "-alpha_q", "100",
        "-m", "6",
        "-mt",
        $inputPath,
        "-o", $outputPath
    ) -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputPath)) {
        $originalSize = [math]::Round($pngFile.Length / 1KB, 2)
        $webpSize = [math]::Round((Get-Item $outputPath).Length / 1KB, 2)
        $savings = [math]::Round((($pngFile.Length - (Get-Item $outputPath).Length) / $pngFile.Length) * 100, 1)
        
        Write-Host "    [SUCCESS] $($pngFile.BaseName).webp" -ForegroundColor Green
        Write-Host "    Original: $originalSize KB | WebP: $webpSize KB | Savings: $savings%" -ForegroundColor DarkGray
        $successCount++
    } else {
        Write-Host "    [FAIL] Failed to convert $($pngFile.Name)" -ForegroundColor Red
        $failCount++
    }
    Write-Host ""
}

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Conversion Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Summary:" -ForegroundColor Yellow
Write-Host "  Success: $successCount" -ForegroundColor Green
Write-Host "  Failed: $failCount" -ForegroundColor $(if ($failCount -gt 0) { "Red" } else { "Gray" })
Write-Host "  Output directory: $outputDir" -ForegroundColor White
Write-Host ""

# Calculate total sizes
$totalPngSize = 0
$totalWebpSize = 0

Get-ChildItem $inputDir -Filter "*.png" | ForEach-Object {
    $totalPngSize += $_.Length
}

Get-ChildItem $outputDir -Filter "*.webp" | ForEach-Object {
    $totalWebpSize += $_.Length
}

$totalPngMB = [math]::Round($totalPngSize / 1MB, 2)
$totalWebpMB = [math]::Round($totalWebpSize / 1MB, 2)
$totalSavings = [math]::Round((($totalPngSize - $totalWebpSize) / $totalPngSize) * 100, 1)

Write-Host "Total PNG size: $totalPngMB MB" -ForegroundColor White
Write-Host "Total WebP size: $totalWebpMB MB" -ForegroundColor White
Write-Host "Overall savings: $totalSavings%" -ForegroundColor Green
Write-Host ""
Write-Host "WebP images ready for website deployment!" -ForegroundColor Green
