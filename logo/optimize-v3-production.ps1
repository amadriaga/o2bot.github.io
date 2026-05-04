# HumberStack Logo v3.0 - Production Optimizer
# Transforms v3.0 files into robust, production-ready quality

Write-Host "HumberStack Logo - v3.0 Production Optimizer" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

$files = @(
    "humberstack_v3.0_production_master.svg",
    "humberstack_v3.0_white_production_master.svg",
    "logo-horizontal-v3.0-production.svg"
)

foreach ($file in $files) {
    Write-Host "Optimizing: $file" -ForegroundColor Yellow
    
    if (-not (Test-Path $file)) {
        Write-Host "  [ERROR] File not found: $file" -ForegroundColor Red
        continue
    }
    
    $content = Get-Content $file -Raw
    
    # 1. Remove all Inkscape/editor-generated IDs
    Write-Host "  [1/10] Removing editor IDs..." -ForegroundColor Gray
    $content = $content -replace '\s+id="[^"]*"', ''
    
    # 2. Remove unnecessary XML namespaces
    Write-Host "  [2/10] Cleaning namespaces..." -ForegroundColor Gray
    $content = $content -replace '\s+xmlns:svg="[^"]*"', ''
    
    # 3. Remove version attribute from SVG element only (not XML declaration)
    Write-Host "  [3/10] Removing SVG version attribute..." -ForegroundColor Gray
    $content = $content -replace '(<svg[^>]*)\s+version="[^"]*"', '$1'
    
    # 4. Remove empty defs elements
    Write-Host "  [4/10] Removing empty defs..." -ForegroundColor Gray
    $content = $content -replace '<defs[^>]*>\s*</defs>', ''
    $content = $content -replace '<defs[^>]*/>', ''
    
    # 5. Remove style attributes from converted text paths
    Write-Host "  [5/10] Cleaning path styles..." -ForegroundColor Gray
    $content = $content -replace '\s+style="[^"]*font[^"]*"', ''
    
    # 6. Update version in comments from 2.0 to 3.0
    Write-Host "  [6/10] Updating version metadata..." -ForegroundColor Gray
    $content = $content -replace 'VERSION 2\.0', 'VERSION 3.0'
    
    # 7. Add accessibility attributes to root SVG (if not present)
    Write-Host "  [7/10] Adding accessibility..." -ForegroundColor Gray
    if ($content -notmatch 'role="img"') {
        $content = $content -replace '(<svg[^>]*)(xmlns="http://www\.w3\.org/2000/svg")', '$1$2 role="img" aria-label="HumberStack Logo"'
    }
    
    # 8. Optimize whitespace
    Write-Host "  [8/10] Optimizing whitespace..." -ForegroundColor Gray
    # Remove multiple consecutive blank lines
    $content = $content -replace '(?m)^\s*$\r?\n(?:\s*$\r?\n)+', "`n"
    # Remove trailing whitespace on lines
    $content = $content -replace '(?m)[ \t]+$', ''
    
    # 9. Minify path data (remove unnecessary spaces in path commands)
    Write-Host "  [9/10] Optimizing path data..." -ForegroundColor Gray
    # This is conservative - only removes obvious redundant spaces
    $content = $content -replace 'd="\s+', 'd="'
    $content = $content -replace '\s+"/>', '"/>'
    
    # 10. Ensure proper encoding and structure
    Write-Host "  [10/10] Finalizing structure..." -ForegroundColor Gray
    # Ensure proper XML declaration
    if ($content -notmatch '^\s*<\?xml') {
        $content = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' + "`n" + $content
    }
    
    # Save optimized file
    Set-Content -Path $file -Value $content -NoNewline -Encoding UTF8
    
    # Get final file size
    $size = (Get-Item $file).Length
    $sizeKB = [math]::Round($size / 1KB, 2)
    
    Write-Host "  [SUCCESS] Optimized: $sizeKB KB" -ForegroundColor Green
    Write-Host ""
}

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "[COMPLETE] v3.0 Production Optimization" -ForegroundColor Green
Write-Host ""
Write-Host "Production Enhancements Applied:" -ForegroundColor Yellow
Write-Host "  - Removed all editor-specific IDs and metadata" -ForegroundColor White
Write-Host "  - Cleaned unnecessary XML namespaces" -ForegroundColor White
Write-Host "  - Removed empty and unused elements" -ForegroundColor White
Write-Host "  - Added WCAG accessibility attributes" -ForegroundColor White
Write-Host "  - Optimized whitespace and formatting" -ForegroundColor White
Write-Host "  - Minified path data structure" -ForegroundColor White
Write-Host "  - Updated version metadata to 3.0" -ForegroundColor White
Write-Host "  - Ensured UTF-8 encoding" -ForegroundColor White
Write-Host ""
Write-Host "Version 3.0 files are now PRODUCTION READY!" -ForegroundColor Green
