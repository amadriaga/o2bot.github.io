# Email Setup for o2bot.com

Complete guide and tools for setting up free Cloudflare Email Routing for your domain.

## 📁 Files in This Directory

- **QUICK-START.md** - 5-minute checklist to get email working
- **email-setup-guide.md** - Complete documentation and setup instructions
- **email-worker-example.js** - Worker code for sending emails
- **dns-records-reference.md** - DNS configuration reference
- **wrangler.toml** - Cloudflare Workers deployment config

## 🚀 Quick Start

1. Open [QUICK-START.md](QUICK-START.md) for a simple checklist
2. Go to Cloudflare Dashboard → o2bot.com → Email Routing
3. Enable Email Routing and add your destination email
4. Create email addresses like contact@o2bot.com

## 📧 What You Get (Free)

- ✅ Unlimited email addresses @o2bot.com
- ✅ Forward to any existing email (Gmail, Outlook, etc.)
- ✅ Up to 200 routing rules
- ✅ 25MB attachment support

## 📤 Sending Emails

Email Routing only receives emails. To send FROM your custom address:

1. **Email Worker** (recommended) - Deploy the included Worker with Resend/SendGrid
2. **Gmail SMTP** - Configure Gmail to send as your custom address
3. **Third-party service** - Use Mailgun, Postmark, etc.

See [email-worker-example.js](email-worker-example.js) for code.

## 📚 Full Documentation

- [Email Setup Guide](email-setup-guide.md) - Complete instructions
- [DNS Records Reference](dns-records-reference.md) - DNS configuration details

## 🔗 Integration with Website

The website's contact form ([../o2bot/contact.html](../o2bot/contact.html)) is ready to integrate with an Email Worker once deployed.

## 🆘 Support

Questions? Email: contact@o2bot.com
