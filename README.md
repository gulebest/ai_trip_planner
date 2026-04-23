# AI Trip Planner

AI Trip Planner is a Flutter mobile app with a Render-hosted Node.js backend.
The mobile app sends trip prompts to the backend, and the backend securely calls
OpenRouter (Gemini model family) using server-side environment variables.

## Current Architecture

- Frontend: Flutter
- Backend: Express API on Render
- AI Provider: OpenRouter
- Security: API key is stored only on backend (`OPENROUTER_API_KEY`)

## API

- `GET /health`: health check
- `POST /generate-trip`
  - request body: `{ "prompt": "..." }`
  - response body: `{ "trip": "..." }`

## Local Backend Run

1. Copy `.env.example` to `.env`
2. Set `OPENROUTER_API_KEY` in `.env`
3. Install dependencies:

```bash
npm install
```

4. Start server:

```bash
npm run dev
```
