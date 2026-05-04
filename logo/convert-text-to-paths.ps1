# Convert Text to Paths for Version 2.0
# This script converts v1.0 logo files with text to v2.0 with outlined paths

Write-Host "HumberStack Logo - Text to Paths Converter" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if Inkscape is installed
$inkscapePath = $null
$possiblePaths = @(
    "C:\Program Files\Inkscape\bin\inkscape.exe",
    "C:\Program Files (x86)\Inkscape\bin\inkscape.exe",
    "$env:LOCALAPPDATA\Programs\Inkscape\bin\inkscape.exe"
)

foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $inkscapePath = $path
        break
    }
}

if (-not $inkscapePath) {
    Write-Host "❌ Inkscape not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Inkscape first:" -ForegroundColor Yellow
    Write-Host "  winget install Inkscape.Inkscape" -ForegroundColor White
    Write-Host ""
    Write-Host "Or download from: https://inkscape.org/release/" -ForegroundColor White
    Write-Host ""
    Write-Host "After installation, run this script again." -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Found Inkscape at: $inkscapePath" -ForegroundColor Green
Write-Host ""

# Define files to convert
$conversions = @(
    @{
        Input = "humberstack_v1.0_helvetica_neue_text_master.svg"
        Output = "humberstack_v2.0_outlines_master.svg"
        Description = "Main logo with text"
    },
    @{
        Input = "humberstack_v1.0_white_master.svg"
        Output = "humberstack_v2.0_white_outlines_master.svg"
        Description = "White version for dark backgrounds"
    },
    @{
        Input = "logo-horizontal.svg"
        Output = "logo-horizontal-v2.0-outlines.svg"
        Description = "Horizontal layout"
    }
)

$success = 0
$failed = 0

foreach ($conversion in $conversions) {
    $inputFile = $conversion.Input
    $outputFile = $conversion.Output
    $description = $conversion.Description
    
    Write-Host "Converting: $description" -ForegroundColor Cyan
    Write-Host "  Input:  $inputFile" -ForegroundColor Gray
    Write-Host "  Output: $outputFile" -ForegroundColor Gray
    
    if (-not (Test-Path $inputFile)) {
        Write-Host "  ❌ Input file not found, skipping..." -ForegroundColor Red
        $failed++
        Write-Host ""
        continue
    }
    
    # Inkscape command to convert text to path
    # --export-text-to-path converts all text elements to paths
    $arguments = @(
        "--export-filename=$outputFile",
        "--export-text-to-path",
        "--export-plain-svg",
        $inputFile
    )
    
    try {
        $process = Start-Process -FilePath $inkscapePath -ArgumentList $arguments -Wait -NoNewWindow -PassThru
        
        if ($process.ExitCode -eq 0 -and (Test-Path $outputFile)) {
            Write-Host "  ✅ Successfully created $outputFile" -ForegroundColor Green
            $success++
            
            # Update header comment in the file
            $content = Get-Content $outputFile -Raw
            $content = $content -replace "VERSION 1\.0", "VERSION 2.0"
            $content = $content -replace "Font-dependent: Uses Helvetica Neue text elements", "Font-independent: All text converted to paths"
            $content = $content -replace "Text editable", "Text as outlined paths (not editable)"
            Set-Content -Path $outputFile -Value $content -NoNewline
            
            Write-Host "  ✅ Updated version metadata" -ForegroundColor Green
        } else {
            Write-Host "  ❌ Conversion failed" -ForegroundColor Red
            $failed++
        }
    } catch {
        Write-Host "  ❌ Error: $_" -ForegroundColor Red
        $failed++
    }
    
    Write-Host ""
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Conversion Summary:" -ForegroundColor Cyan
Write-Host "  ✅ Successful: $success" -ForegroundColor Green
Write-Host "  ❌ Failed: $failed" -ForegroundColor Red
Write-Host ""

if ($success -gt 0) {
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Open the v2.0 files in a browser to verify" -ForegroundColor White
    Write-Host "2. Check that text is rendered correctly" -ForegroundColor White
    Write-Host "3. Update VERSION-CONTROL.md with v2.0 information" -ForegroundColor White
    Write-Host ""
    Write-Host "Version 2.0 files are now ready for production use! 🎉" -ForegroundColor Green
}
