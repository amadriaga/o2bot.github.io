# HumberStack Logo & Brand Assets

Logo and branding resources for o2bot.com.

> **✅ Production Ready**: Version 2.0 files are optimized and validated for production use. See [PRODUCTION-QUALITY-REPORT-v2.md](PRODUCTION-QUALITY-REPORT-v2.md) for details.

> **⚠️ Important**: Production master files are version-controlled and locked. See [VERSION-CONTROL.md](VERSION-CONTROL.md) for modification procedures.

## 📁 Logo Files

### ⭐ Production Files (v2.0 - RECOMMENDED)
**Font-independent, production-ready, validated quality**

- **o2bot_v2.0_outlines_master.svg** - Main logo, text as paths (7.14 KB) ✓
- **o2bot_v2.0_white_outlines_master.svg** - White version for dark backgrounds (6.66 KB) ✓
- **logo-horizontal-v2.0-outlines.svg** - Horizontal layout, text as paths (7.37 KB) ✓

**Why v2.0?** No font dependencies, universal compatibility, guaranteed rendering on all platforms.

### Source Files (v1.0 - For Editing)
**Font-based, editable text, source control**

- **o2bot_v1.0_helvetica_neue_text_master.svg** - Primary logo with editable text (550x140)
- **o2bot_v1.0_white_master.svg** - White version with editable text
- **o2bot_icon_v1.0_master.svg** - Square icon only (200x200)
- **o2bot_favicon_v1.0_master.svg** - Optimized favicon (32x32)

**Use v1.0 when:** Making text edits, creating variations, maintaining source files.

### Legacy/Simple Versions
- **logo.svg** - Simple square logo (200x200), full color with gradient
- **logo-horizontal.svg** - Logo with "O2Bot" text (600x200)
- **favicon.svg** - Simplified icon for favicon (32x32)
- **logo-white.svg** - White version for dark backgrounds
- **logo-black.svg** - Black version for light backgrounds

### Source File
- **humberlift_v1.0_helvetica_neue_text_master.svg** - Original Humberlift template

### PNG Exports (Coming Soon)
Generate PNG versions in various sizes:
- 16x16, 32x32, 48x48, 64x64 (favicons)
- 192x192, 512x512 (PWA icons)
- 1024x1024 (high resolution)

## 🎨 Brand Colors

```css
/* Primary Colors */
--primary-blue: #3b82f6;
--primary-dark: #2563eb;
--secondary-green: #10b981;

/* Neutral Colors */
--text-dark: #1f2937;
--text-light: #6b7280;
--bg-light: #f9fafb;
--bg-white: #ffffff;
```

### Color Palette
- **Primary Blue**: `#3b82f6` - Main brand color
- **Primary Dark**: `#2563eb` - Gradient accent
- **Secondary Green**: `#10b981` - Call-to-action
- **Dark Gray**: `#1f2937` - Text and dark logo
- **Light Gray**: `#6b7280` - Secondary text

## 📐 Logo Usage Guidelines

### Minimum Size
- Digital: 32px minimum height
- Print: 0.5 inches minimum height

### Clear Space
Maintain clear space around the logo equal to the height of the "H" in the symbol.

### Do's
✅ Use on solid backgrounds
✅ Maintain proportions
✅ Use provided color variations
✅ Keep minimum size requirements

### Don'ts
❌ Don't distort or stretch
❌ Don't rotate the logo
❌ Don't change colors arbitrarily
❌ Don't add effects (shadows, outlines)

## 🌐 Favicon Integration

### For Website (HTML)
Add to the `<head>` section of your HTML:

```html
<!-- Favicon - Production Master Version -->
<link rel="icon" type="image/svg+xml" href="/logo/o2bot_favicon_v1.0_master.svg">
<link rel="icon" type="image/png" sizes="32x32" href="/logo/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/logo/favicon-16x16.png">
<link rel="apple-touch-icon" sizes="180x180" href="/logo/apple-touch-icon.png">

<!-- For PWA -->
<link rel="manifest" href="/manifest.json">
```

### Using Production Master Logo
```html
<!-- Primary logo (light backgrounds) -->
<img src="/logo/o2bot_v1.0_helvetica_neue_text_master.svg" alt="O2Bot" height="70">

<!-- White version (dark backgrounds) -->
<img src="/logo/o2bot_v1.0_white_master.svg" alt="O2Bot" height="70">

<!-- Icon only -->
<img src="/logo/o2bot_icon_v1.0_master.svg" alt="O2Bot" width="60" height="60">
```

### Manifest.json (PWA)
```json
{
  "name": "O2Bot",
  "short_name": "O2Bot",
  "icons": [
    {
      "src": "/logo/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/logo/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#3b82f6",
  "background_color": "#ffffff",
  "display": "standalone"
}
```

## 🖼️ Social Media Sizes

### Recommended Exports
- **Open Graph (Facebook/LinkedIn)**: 1200x630px
- **Twitter Card**: 1200x675px
- **Profile Picture**: 400x400px (square)
- **Cover Photo**: 1500x500px

## 🔧 Generating PNG Files

### Using Inkscape (Command Line)
```bash
# Install Inkscape first
# Windows: choco install inkscape
# Mac: brew install inkscape

# Generate from master logo
.\generate-png.ps1

# Generate from icon version (square formats)
.\generate-png.ps1 -Icon

# Generate all sizes including high-res
.\generate-png.ps1 -All
```

### Specific Size Examples
```bash
# From master logo file
inkscape o2bot_v1.0_helvetica_neue_text_master.svg -w 500 -h 140 -o logo-500x140.png

# From icon file
inkscape o2bot_icon_v1.0_master.svg -w 192 -h 192 -o icon-192x192.png
inkscape o2bot_icon_v1.0_master.svg -w 512 -h 512 -o icon-512x512.png

# Favicon from favicon master
inkscape o2bot_favicon_v1.0_master.svg -w 32 -h 32 -o favicon-32x32.png
```

### Using Online Tools
- [Favicon Generator](https://realfavicongenerator.net/)
- [SVG to PNG](https://svgtopng.com/)
- [CloudConvert](https://cloudconvert.com/svg-to-png)

## 📝 Typography

### Primary Font
**System Font Stack** (no external dependencies):
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 
             'Helvetica Neue', Arial, sans-serif;
```

### Font Weights
- Regular: 400
- Medium: 500
- Bold: 700

## 📄 File production master logo to your website:

1. **Copy logo files** to `o2bot/logo/` directory
2. **Update HTML** with favicon links (see above)
3. **Reference in HTML**:
   ```html
   <!-- In header/navbar -->
   <img src="/logo/o2bot_v1.0_helvetica_neue_text_master.svg" 
        alt="O2Bot" 
        height="70">
   ```

4. **For CSS backgrounds**:
   ```css
   .logo {
     background-image: url('/logo/o2bot_icon_v1.0_master.svg');
     width: 60px;
     height: 60px;
   }
   ```

## 📋 Version Control

All production master files are version-controlled and locked. See [VERSION-CONTROL.md](VERSION-CONTROL.md) for:
- Version history
- Modification procedures
- Design specifications
- File naming conventions
- Quality checklistail signatures
- ⚠️ Generate from SVG as needed

## 🚀 Quick Integration

To add the logo to your website:

1. **Copy logo files** to `o2bot/logo/` directory
2. **Update HTML** with favicon links
3. **Update CSS** to reference logo files:
   ```css
   .logo {
     background-image: url('/logo/logo.svg');
     width: 200px;
     height: 200px;
   }
   ```

## 📞 Contact

Questions about brand usage?
Email: contact@o2bot.com

---

© 2026 O2Bot. All rights reserved.
