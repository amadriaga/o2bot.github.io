// Cloudflare Email Worker Example
// This worker can send emails using an external email API
// Deploy this to send emails FROM your o2bot.com domain

// Example using Resend API (resend.com) - Free tier: 100 emails/day
export default {
  async fetch(request, env) {
    // Handle CORS preflight
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'POST, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
        },
      });
    }

    if (request.method !== 'POST') {
      return new Response('Method not allowed', { status: 405 });
    }

    try {
      const { to, subject, message, from = 'contact@o2bot.com' } = await request.json();

      // Validate inputs
      if (!to || !subject || !message) {
        return new Response(JSON.stringify({ error: 'Missing required fields' }), {
          status: 400,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      // Send email via Resend API
      // Set RESEND_API_KEY as an environment variable in Cloudflare Workers
      const response = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${env.RESEND_API_KEY}`,
        },
        body: JSON.stringify({
          from: from,
          to: to,
          subject: subject,
          html: message,
        }),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.message || 'Failed to send email');
      }

      return new Response(JSON.stringify({ success: true, id: result.id }), {
        status: 200,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      });
    } catch (error) {
      return new Response(JSON.stringify({ error: error.message }), {
        status: 500,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      });
    }
  },
};

// Alternative: Email Worker with Mailgun
/*
const MAILGUN_API_KEY = env.MAILGUN_API_KEY;
const MAILGUN_DOMAIN = 'o2bot.com';

const response = await fetch(
  `https://api.mailgun.net/v3/${MAILGUN_DOMAIN}/messages`,
  {
    method: 'POST',
    headers: {
      Authorization: `Basic ${btoa(`api:${MAILGUN_API_KEY}`)}`,
    },
    body: new URLSearchParams({
      from: `O2Bot <contact@o2bot.com>`,
      to: to,
      subject: subject,
      html: message,
    }),
  }
);
*/

// Usage from your website:
/*
<form id="contactForm">
  <input type="email" name="to" required>
  <input type="text" name="subject" required>
  <textarea name="message" required></textarea>
  <button type="submit">Send</button>
</form>

<script>
document.getElementById('contactForm').addEventListener('submit', async (e) => {
  e.preventDefault();
  const formData = new FormData(e.target);
  
  const response = await fetch('https://email.o2bot.com', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      to: formData.get('to'),
      subject: formData.get('subject'),
      message: formData.get('message'),
    }),
  });
  
  const result = await response.json();
  alert(result.success ? 'Email sent!' : 'Error: ' + result.error);
});
</script>
*/
