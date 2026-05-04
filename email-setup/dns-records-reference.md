# DNS Records Reference for o2bot.com Email

## Email Routing Records (Auto-configured by Cloudflare)

When you enable Email Routing in the Cloudflare dashboard, these records are automatically added:

### MX Records
```
Type: MX
Name: @ (or o2bot.com)
Priority: 1
Value: isaac.mx.cloudflare.net

Type: MX
Name: @ (or o2bot.com)
Priority: 2
Value: linda.mx.cloudflare.net

Type: MX
Name: @ (or o2bot.com)
Priority: 3
Value: amir.mx.cloudflare.net
```

### SPF Record
```
Type: TXT
Name: @ (or o2bot.com)
Value: v=spf1 include:_spf.mx.cloudflare.net ~all
```

## Additional Recommended Records

### DMARC (Email Authentication & Reporting)
```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=quarantine; rua=mailto:dmarc@o2bot.com; ruf=mailto:dmarc@o2bot.com; fo=1
```

This tells receiving servers:
- `p=quarantine` - Put suspicious emails in spam (use `p=reject` for stricter policy)
- `rua=mailto:dmarc@o2bot.com` - Send aggregate reports here
- `ruf=mailto:dmarc@o2bot.com` - Send forensic reports here

### DKIM (If using third-party email service)

If you use Resend, SendGrid, Mailgun, etc., they'll provide DKIM records like:

```
Type: TXT
Name: resend._domainkey (or similar)
Value: [Provided by email service]
```

## Verification Commands

Check your DNS records from command line:

### Check MX Records
```powershell
nslookup -type=MX o2bot.com
```

### Check SPF Record
```powershell
nslookup -type=TXT o2bot.com
```

### Check DMARC Record
```powershell
nslookup -type=TXT _dmarc.o2bot.com
```

## Online Tools

Verify your email DNS setup:
- https://mxtoolbox.com/SuperTool.aspx?action=mx%3ao2bot.com
- https://dmarcian.com/domain-checker/
- https://www.mail-tester.com/
