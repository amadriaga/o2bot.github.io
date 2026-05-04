# HumberStack Logo v2.0 - Quick Deployment Guide

## 🚀 Ready to Deploy!

Your v2.0 logo files are **production-ready** and **validated**. Follow this guide for quick integration.

---

## 📦 Files to Use

### For Production Websites
```
✅ o2bot_v2.0_outlines_master.svg (7.14 KB)
   - Use on light backgrounds
   - Default choice for most pages
   
✅ o2bot_v2.0_white_outlines_master.svg (6.66 KB)
   - Use on dark backgrounds
   - Dark mode, footers
   
✅ logo-horizontal-v2.0-outlines.svg (7.37 KB)
   - Wide layouts, banners
   - Social media headers
```

---

## 🌐 HTML Integration

### Basic HTML
```html
<!-- Light background -->
<img src="./o2bot_v2.0_outlines_master.svg" 
     alt="HumberStack Logo" 
     width="275" 
     height="70">

<!-- Dark background -->
<img src="./o2bot_v2.0_white_outlines_master.svg" 
     alt="HumberStack Logo" 
     width="275" 
     height="70">
```

### Inline SVG (Best Performance)
```html
<!-- Copy SVG content directly into HTML -->
<div class="logo">
  <?php include 'o2bot_v2.0_outlines_master.svg'; ?>
</div>
```

### CSS Background
```css
.header-logo {
  background-image: url('o2bot_v2.0_outlines_master.svg');
  background-size: contain;
  background-repeat: no-repeat;
  width: 275px;
  height: 70px;
}
```

---

## ⚛️ React/Next.js Integration

### Method 1: Import as Component
```jsx
import Logo from './o2bot_v2.0_outlines_master.svg';

function Header() {
  return (
    <div className="header">
      <Logo width={275} height={70} />
    </div>
  );
}
```

### Method 2: Next.js Image
```jsx
import Image from 'next/image';
import logo from './o2bot_v2.0_outlines_master.svg';

function Header() {
  return (
    <Image
      src={logo}
      alt="HumberStack Logo"
      width={275}
      height={70}
      priority
    />
  );
}
```

### Method 3: Direct SVG
```jsx
function Logo() {
  return (
    <svg viewBox="0 0 550 140" className="logo">
      {/* Paste SVG content here */}
    </svg>
  );
}
```

---

## 🎨 CSS Styling

### Responsive Sizing
```css
.logo {
  width: 275px;
  max-width: 100%;
  height: auto;
}

/* Mobile */
@media (max-width: 768px) {
  .logo {
    width: 200px;
  }
}
```

### Dark Mode Toggle
```css
/* Light mode */
.logo-light {
  display: block;
}
.logo-dark {
  display: none;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .logo-light {
    display: none;
  }
  .logo-dark {
    display: block;
  }
}
```

### Hover Effects
```css
.logo {
  transition: transform 0.3s ease;
}

.logo:hover {
  transform: scale(1.05);
}
```

---

## 📱 Cloudflare Pages Deployment

### 1. Copy Files to Project
```powershell
# Copy to your o2bot website
cd d:\dev\cloudflare-websites\o2bot\

# Create assets directory
mkdir assets\logos -Force

# Copy v2.0 files
Copy-Item ..\logo\o2bot_v2.0_outlines_master.svg assets\logos\
Copy-Item ..\logo\o2bot_v2.0_white_outlines_master.svg assets\logos\
Copy-Item ..\logo\logo-horizontal-v2.0-outlines.svg assets\logos\
```

### 2. Update HTML References
```html
<!-- In index.html, about.html, etc. -->
<img src="./assets/logos/o2bot_v2.0_outlines_master.svg" 
     alt="HumberStack Logo" 
     width="275" 
     height="70">
```

### 3. Set Cache Headers (wrangler.toml)
```toml
[[headers]]
for = "*.svg"
[headers.values]
Cache-Control = "public, max-age=31536000, immutable"
Content-Type = "image/svg+xml"
```

### 4. Deploy
```bash
# Deploy to Cloudflare Pages
npm run deploy
# or
wrangler pages deploy
```

---

## 🔧 Advanced Usage

### Preload for Performance
```html
<link rel="preload" 
      href="./o2bot_v2.0_outlines_master.svg" 
      as="image" 
      type="image/svg+xml">
```

### Lazy Loading
```html
<img src="./o2bot_v2.0_outlines_master.svg" 
     alt="HumberStack Logo" 
     loading="lazy"
     width="275" 
     height="70">
```

### CDN Integration
```html
<!-- Upload to Cloudflare Images or R2 -->
<img src="https://cdn.o2bot.com/logos/v2/logo.svg" 
     alt="HumberStack Logo">
```

---

## ✅ Verification Checklist

After deployment, verify:

- [ ] Logo displays correctly on all pages
- [ ] Dark mode version works properly
- [ ] Mobile responsive sizing works
- [ ] No font loading errors (should be none!)
- [ ] Accessibility attributes present
- [ ] Cache headers set correctly
- [ ] File loads in <10ms
- [ ] Renders identically across browsers

---

## 🎯 Recommended Sizes

| Use Case | Width | Height | File |
|----------|-------|--------|------|
| **Header/Nav** | 275px | 70px | v2.0 outlines master |
| **Footer** | 200px | 51px | v2.0 white master |
| **Mobile Nav** | 180px | 46px | v2.0 outlines master |
| **Hero Section** | 400px | 102px | horizontal v2.0 |
| **Email Signature** | 220px | 56px | v2.0 outlines master |
| **Favicon** | 32px | 32px | icon v1.0 master |

---

## 📊 Performance Tips

1. **Inline Critical SVG**: Embed logo directly in HTML for above-the-fold content
2. **Use CDN**: Host on Cloudflare R2/Images for global distribution
3. **Enable Compression**: Gzip reduces file size to ~2-3 KB
4. **Set Long Cache**: Use 1-year cache headers
5. **Preload**: Add preload hint for main logo

---

## 🐛 Troubleshooting

### Logo Doesn't Display
- ✅ Check file path is correct
- ✅ Verify file uploaded to server
- ✅ Check MIME type: `image/svg+xml`

### Colors Look Wrong
- ✅ Using white version on light background? Switch to main version
- ✅ CSS overriding colors? Check for conflicting styles

### Blurry on Retina Displays
- ✅ SVG should never be blurry - check if PNG used instead
- ✅ Ensure width/height attributes set correctly

---

## 📞 Need Help?

- **Documentation**: See [PRODUCTION-QUALITY-REPORT-v2.md](PRODUCTION-QUALITY-REPORT-v2.md)
- **Version History**: See [VERSION-CONTROL.md](VERSION-CONTROL.md)
- **Brand Guidelines**: See [BRAND-GUIDELINES.md](BRAND-GUIDELINES.md)

---

**Quick Start**: Copy `o2bot_v2.0_outlines_master.svg` to your project and reference it in `<img>` tags. Done! ✅
