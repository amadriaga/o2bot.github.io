# HumberStack Logo - Quick Reference (Master v1.0)

## 🎯 Master Version 1.0 - Finalized

**Brand Name**: HumberStack (capital H, capital S)  
**Color Accent**: Orange on "Stack" (#f97316)  
**Status**: Production Ready ✅

## 🎨 Logo Design: |||=

The HumberStack logo is a minimal geometric design:
- **Three vertical bars (|||)**: Structure, foundation
- **Three horizontal bars (=)**: Layers, infrastructure  
- **Together**: Modern, efficient, parallel architecture
- **Dimensions**: Thick bars (16-18px), compact square proportions

Clean, simple, instantly recognizable.

## 🎯 Which File Should I Use?

### ⭐ For Production/Final Use (RECOMMENDED)

**Primary Logo (Light Backgrounds)**
```
o2bot_v2.0_outlines_master.svg
```
✅ No font dependencies, works everywhere

**Dark Backgrounds**
```
o2bot_v2.0_white_outlines_master.svg
```
✅ No font dependencies, works everywhere

**Horizontal Layout**
```
logo-horizontal-v2.0-outlines.svg
```
✅ No font dependencies, works everywhere

### 📝 For Editing/Source Files

**Primary Logo (Editable Text)**
```
o2bot_v1.0_helvetica_neue_text_master.svg
```
⚠️ Requires Helvetica Neue font

**White Version (Editable Text)**
```
o2bot_v1.0_white_master.svg
```
⚠️ Requires Helvetica Neue font

### For Website

**Favicon**
```
o2bot_favicon_v1.0_master.svg
```
(No text, works universally)

### For Social Media
**Profile Picture**
```
o2bot_icon_v1.0_master.svg (export to PNG 400x400)
```

**Cover/Banner**
```
o2bot_v1.0_helvetica_neue_text_master.svg (export to PNG 1200x630)
```

### For Print
**Business Cards, Letterhead**
```
o2bot_v1.0_helvetica_neue_text_master.svg (high-res PNG or SVG)
```

**Icon Only**
```
o2bot_icon_v1.0_master.svg
```

## 📏 Standard Sizes

### Favicons
- 16x16px - Browser tab
- 32x32px - Bookmark bar
- 48x48px - Windows taskbar

### Web Icons
- 192x192px - Android Chrome
- 512x512px - PWA splash screen

### Social Media
- 400x400px - Profile pictures
- 1200x630px - Open Graph images
- 1200x675px - Twitter cards

## 🎨 Colors

### Logo Colors
- Dark: `#1a1a1a` (icon background, text)
- White: `#ffffff` (icon elements)

### Brand Colors
- Primary Blue: `#3b82f6`
- Primary Dark: `#2563eb`
- Secondary Green: `#10b981`

## 💻 Quick Commands

### Export to PNG
```powershell
# Standard web logo
inkscape o2bot_v1.0_helvetica_neue_text_master.svg -w 500 -h 140 -o logo.png

# Square icon for social media
inkscape o2bot_icon_v1.0_master.svg -w 400 -h 400 -o icon-400.png

# Favicon
inkscape o2bot_favicon_v1.0_master.svg -w 32 -h 32 -o favicon.png
```

### Generate All PNGs
```powershell
.\generate-png.ps1          # Standard sizes
.\generate-png.ps1 -Icon    # Square icon formats
.\generate-png.ps1 -All     # All sizes including high-res
```

## 📱 HTML Usage

### Basic
```html
<img src="logo/o2bot_v1.0_helvetica_neue_text_master.svg" alt="O2Bot" height="70">
```

### Favicon
```html
<link rel="icon" type="image/svg+xml" href="logo/o2bot_favicon_v1.0_master.svg">
```

### Responsive
```html
<picture>
  <source media="(prefers-color-scheme: dark)" 
          srcset="logo/o2bot_v1.0_white_master.svg">
  <img src="logo/o2bot_v1.0_helvetica_neue_text_master.svg" 
       alt="O2Bot" height="70">
</picture>
```

## ⚠️ Important Rules

### DO
✅ Use master files (_master.svg) for all projects
✅ Export to PNG when needed
✅ Maintain aspect ratios
✅ Use version numbers in file references

### DON'T
❌ Modify master files directly
❌ Change colors arbitrarily
❌ Distort or stretch logos
❌ Use low-resolution versions

## 📖 More Information

- Full documentation: [README.md](README.md)
- Version control: [VERSION-CONTROL.md](VERSION-CONTROL.md)
- Brand guidelines: [BRAND-GUIDELINES.md](BRAND-GUIDELINES.md)

## 🆘 Need Help?

Email: contact@o2bot.com
