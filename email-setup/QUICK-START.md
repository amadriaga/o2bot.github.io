# Quick Start Checklist - Email Setup for o2bot.com

## Step-by-Step Setup (5 minutes)

### ☐ Step 1: Enable Email Routing
1. Go to https://dash.cloudflare.com
2. Click on **o2bot.com**
3. Click **Email** → **Email Routing** in sidebar
4. Click **Get started** or **Enable**

### ☐ Step 2: Add Your Personal Email
1. Click **Add destination address**
2. Enter your Gmail/Outlook/etc. email
3. Check that email inbox for verification link
4. Click the verification link

### ☐ Step 3: Create Email Addresses
Choose one or both options:

**Option A: Specific addresses (recommended)**
- [ ] Create `contact@o2bot.com`
- [ ] Create `info@o2bot.com`
- [ ] Create `support@o2bot.com` (if needed)

**Option B: Catch-all**
- [ ] Enable catch-all to receive *@o2bot.com

### ☐ Step 4: Test It
1. Send an email TO your new address (e.g., contact@o2bot.com)
2. Check your personal email - it should arrive within seconds
3. ✅ Done!

## What You Can Do Now
- ✅ Receive emails at any address @o2bot.com
- ✅ Create unlimited email addresses
- ✅ Forward to multiple destinations

## What Requires Extra Setup
- ❌ Sending emails FROM your custom address (needs Worker or third-party service)
  - See `email-worker-example.js` for Worker solution
  - Or use Resend/SendGrid/Mailgun

## Need Help?
- Full guide: `email-setup-guide.md`
- DNS reference: `dns-records-reference.md`
- Worker code: `email-worker-example.js`
