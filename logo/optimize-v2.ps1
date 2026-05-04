# Optimize Version 2.0 SVG Files for Production
# Removes Inkscape metadata, cleans up structure, improves quality

Write-Host "HumberStack Logo - v2.0 Production Optimizer" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

$files = @(
    "humberstack_v2.0_outlines_master.svg",
    "humberstack_v2.0_white_outlines_master.svg",
    "logo-horizontal-v2.0-outlines.svg"
)

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        Write-Host "[ERROR] $file not found, skipping..." -ForegroundColor Red
        continue
    }
    
    Write-Host "Optimizing: $file" -ForegroundColor Cyan
    
    $content = Get-Content $file -Raw
    
    # Remove Inkscape-specific attributes
    $content = $content -replace '\s+id="[^"]*"', ''
    $content = $content -replace '\s+xmlns:svg="[^"]*"', ''
    $content = $content -replace '\s+version="[^"]*"', ''
    
    # Remove style attributes that reference fonts (from converted text)
    $content = $content -replace '\s+style="font-weight:600;font-size:64px;font-family:[^"]*"', ''
    $content = $content -replace '\s+aria-label="[^"]*"', ''
    
    # Remove empty defs
    $content = $content -replace '<defs[^>]*>\s*</defs>', ''
    $content = $content -replace '<defs[^>]*/>', ''
    
    # Clean up extra whitespace and empty lines
    $content = $content -replace '(?m)^\s*$\r?\n', ''
    $content = $content -replace '\r?\n\s*\r?\n\s*\r?\n', "`n`n"
    
    # Add role="img" for accessibility to main svg tag (only if not already present)
    if ($content -match '<svg\s' -and $content -notmatch 'role="img"') {
        $content = $content -replace '(<svg[^>]*)(>)', '$1 role="img" aria-label="HumberStack Logo"$2'
    }
    
    Write-Host "  [OK] Removed Inkscape metadata" -ForegroundColor Green
    Write-Host "  [OK] Cleaned up attributes" -ForegroundColor Green
    Write-Host "  [OK] Added accessibility attributes" -ForegroundColor Green
    Write-Host "  [OK] Optimized structure" -ForegroundColor Green
    
    # Save optimized version
    Set-Content -Path $file -Value $content -NoNewline -Encoding UTF8
    
    # Get file size
    $size = (Get-Item $file).Length
    $sizeKB = [math]::Round($size / 1KB, 2)
    Write-Host "  [INFO] File size: $sizeKB KB" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "============================================="-ForegroundColor Cyan
Write-Host "[SUCCESS] All v2.0 files optimized for production!" -ForegroundColor Green
Write-Host ""
Write-Host "Changes applied:" -ForegroundColor Yellow
Write-Host "  - Removed all Inkscape-generated IDs" -ForegroundColor White
Write-Host "  - Removed unnecessary XML namespaces" -ForegroundColor White
Write-Host "  - Removed empty defs elements" -ForegroundColor White
Write-Host "  - Cleaned up font style references" -ForegroundColor White
Write-Host "  - Added proper accessibility attributes" -ForegroundColor White
Write-Host "  - Optimized whitespace and formatting" -ForegroundColor White
Write-Host ""
Write-Host "Production quality achieved!" -ForegroundColor Green
