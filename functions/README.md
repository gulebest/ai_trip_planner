# Functions (Captcha verifier)

This folder contains a simple Express-based verifier for human verification tokens.

Development:

1. Install deps:

```bash
cd functions
npm install
```

2. Run locally:

```bash
node index.js
```

The server accepts POST /verifyCaptcha with JSON body `{ "token": "..." }`.
For local development the token `dev-pass` will be accepted as valid. Replace with real reCAPTCHA server-side verification in production.
