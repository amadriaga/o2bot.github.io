# O2Bot Website

Source for [o2bot.com](https://o2bot.com) — hosted on GitHub Pages.

## Project Structure

```
o2bot-website/
├── index.html          # Homepage
├── about.html          # About page
├── contact.html        # Contact page with form
├── 404.html            # Custom 404 page
├── styles.css          # Styles
├── script.js           # JavaScript
├── CNAME               # GitHub Pages custom domain (o2bot.com)
├── _headers            # Security headers (for Cloudflare Pages if migrated)
└── email-setup/        # Email setup reference docs
```

## Deployment — GitHub Pages

Repo: `https://github.com/amadriaga/o2bot.github.io`

1. Push to `main` branch — GitHub Pages auto-deploys
2. Custom domain is set via `CNAME` file (`o2bot.com`)
3. In repo Settings → Pages → Custom domain → `o2bot.com`, enable HTTPS

## Cloudflare DNS (required for custom domain)

| Type | Name | Content | Proxy |
|------|------|---------|-------|
| A | `@` | `185.199.108.153` | DNS only |
| A | `@` | `185.199.109.153` | DNS only |
| A | `@` | `185.199.110.153` | DNS only |
| A | `@` | `185.199.111.153` | DNS only |
| CNAME | `www` | `amadriaga.github.io` | DNS only |

> Keep Cloudflare proxy **off (grey cloud)** for GitHub Pages — HTTPS is handled by GitHub.

## Contact Form

Uses Formspree (`https://formspree.io/f/xvzdadga`). Update the action URL in `contact.html` if a new form endpoint is needed.

## Local Development

```bash
python -m http.server 8000
# visit http://localhost:8000
```
