const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Simple local verification stub for captcha.
// In production, verify with Google reCAPTCHA endpoint using SECRET_KEY.

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.post('/verifyCaptcha', async (req, res) => {
  const token = req.body?.token;

  // Development helper: accept token 'dev-pass' as valid
  if (!token) return res.status(400).json({ success: false, message: 'no token' });
  if (token === 'dev-pass') return res.json({ success: true });

  // TODO: perform real verification with reCAPTCHA
  // Example (node-fetch):
  // const secret = process.env.RECAPTCHA_SECRET;
  // const verifyRes = await fetch(`https://www.google.com/recaptcha/api/siteverify?secret=${secret}&response=${token}`, { method: 'POST' });
  // const data = await verifyRes.json();
  // return res.json(data);

  // Default reject
  return res.json({ success: false });
});

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Captcha verifier listening on ${port}`));

module.exports = app;
