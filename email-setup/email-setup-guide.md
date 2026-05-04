# Cloudflare Email Routing Setup for o2bot.com

## Overview
Cloudflare Email Routing is a free service that allows you to create custom email addresses at your domain (like contact@o2bot.com) and forward them to your existing email account.

## Setup Steps

### 1. Access Email Routing in Cloudflare Dashboard
1. Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Select your domain: **o2bot.com**
3. Navigate to **Email** → **Email Routing** in the left sidebar

### 2. Enable Email Routing
1. Click **Get started** or **Enable Email Routing**
2. Cloudflare will automatically configure the necessary DNS records (MX and TXT records)
3. Wait for DNS propagation (usually a few minutes)

### 3. Add a Destination Email Address
1. In the **Destination addresses** section, click **Add destination address**
2. Enter your personal email address (Gmail, Outlook, etc.) where you want to receive emails
3. Verify the destination email by clicking the link sent to that address

### 4. Create Email Routing Rules
Once your destination is verified, create custom email addresses:

**Option A: Specific Addresses**
- Click **Create address**
- Enter the custom address (e.g., `contact`, `hello`, `support`)
- Choose the destination email where it should forward
- Click **Save**

**Option B: Catch-All** (receives all emails to any address at your domain)
- Enable **Catch-all address**
- Select the destination email
- This will forward *@o2bot.com to your chosen email

### 5. Verify Setup
Send a test email to your new address (e.g., contact@o2bot.com) and confirm it arrives at your destination email.

## Recommended Email Addresses

Here are some common email addresses you might want to create:

- `contact@o2bot.com` - General inquiries and contact form
- `info@o2bot.com` - Information requests
- `support@o2bot.com` - Customer support
- `info@o2bot.com` - Information requests
- `admin@o2bot.com` - Administrative matters
- `noreply@o2bot.com` - Automated emails (forward to trash or monitoring)

## Sending Emails

**Important**: Email Routing only handles **incoming** emails. To send emails FROM your custom address:

### Option 1: SMTP Relay via Gmail/Outlook
1. In Gmail:
   - Go to Settings → Accounts and Import → Send mail as
   - Add your custom email address
   - Use Cloudflare's SMTP settings if available, or configure SPF/DKIM records

### Option 2: Use Cloudflare Email Workers
- Set up a Worker to send emails via an email API (like Resend, SendGrid, Mailgun)
- See `email-worker-example.js` for a template

### Option 3: Third-party Email Service
- Use services like Resend, Postmark, or SendGrid
- Configure their DNS records (SPF, DKIM, DMARC)

## DNS Records (Auto-configured)

When you enable Email Routing, Cloudflare adds these records:

```
MX Records:
Priority 1: isaac.mx.cloudflare.net
Priority 2: linda.mx.cloudflare.net
Priority 3: amir.mx.cloudflare.net

TXT Record:
v=spf1 include:_spf.mx.cloudflare.net ~all
```

## Limitations

- **Free tier limits**: Up to 200 routing rules
- **Incoming only**: Cannot send emails directly (need Workers or third-party service)
- **No email storage**: Emails are immediately forwarded, not stored
- **Attachment size**: Up to 25MB per email

## Troubleshooting

### Emails not arriving?
1. Check that DNS records are active (not proxied for MX records)
2. Verify your destination email is confirmed
3. Check spam folder in destination email
4. Wait 24-48 hours for full DNS propagation

### Want to send emails too?
See the Worker example in this repository or set up SPF/DKIM records for a third-party email service.

## Next Steps

After email routing is working, consider:
1. Setting up DMARC records for better email security
2. Creating an Email Worker for sending capabilities
3. Integrating with contact forms on your website
