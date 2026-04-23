const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Use PORT from environment variables, or fallback to 3002 locally
const PORT = process.env.PORT || 3002;
const OPENROUTER_API_KEY = process.env.OPENROUTER_API_KEY;

// Clean cross-origin setup for development and production
app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'AI Trip Planner Backend is running.' });
});

// Main generate-trip endpoint
app.post('/generate-trip', async (req, res) => {
  const { destination, budget, duration, interests } = req.body;

  // Basic validation
  if (!destination || !duration) {
    return res.status(400).json({ 
      error: 'Missing required fields. Please provide destination and duration.' 
    });
  }

  if (!OPENROUTER_API_KEY) {
    return res.status(500).json({
      error: 'Server configuration error: Missing OPENROUTER_API_KEY in .env file.'
    });
  }

  // Strong Prompt Engineering forcing valid JSON
  const prompt = `Provide a detailed travel itinerary for ${destination}.
Duration: ${duration} days
Budget: ${budget || 'moderate'}
Interests: ${interests ? interests.join(', ') : 'general sightseeing'}

You must respond with ONLY a raw, valid JSON object matching the exact structure below. 
Generate exactly ${duration} days in the "days" array. 
For EACH day, generate at least 4-5 activities in the "activities" array, covering morning, afternoon, and evening.
Ensure the "dayTitle" increments correctly for each day (e.g., "Day 1", "Day 2", "Day 3").
EVERY activity MUST have a "time", a short "title" (e.g., "Visit Central Park"), a detailed "description", and a "location".

Do not include markdown formatting like \`\`\`json, do not include any conversational text, explanations, or extra spaces.

Here is an example of the EXACT structure required:
{
  "destination": "${destination}",
  "budget": "${budget || 'moderate'}",
  "durationDays": ${duration},
  "days": [
    {
      "dayTitle": "Day 1",
      "activities": [
        {
          "time": "09:00 AM",
          "title": "Morning Coffee and Pastries",
          "description": "Start the day with a warm coffee and local pastries at a top-rated cafe.",
          "location": "Downtown Cafe"
        },
        {
          "time": "11:00 AM",
          "title": "Museum Tour",
          "description": "Explore the local history and art at the famous city museum.",
          "location": "City Museum"
        }
      ]
    }
  ]
}`;

  try {
    const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${OPENROUTER_API_KEY}`,
        // Optional tracking headers for OpenRouter
        'HTTP-Referer': 'https://aitripplanner.app',
        'X-Title': 'AI Trip Planner'
      },
      body: JSON.stringify({
        model: 'openrouter/free',
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7
      })
    });

    if (!response.ok) {
      if (response.status === 401) {
        return res.status(401).json({ error: 'Unauthorized: Invalid OpenRouter API key.' });
      }
      if (response.status === 429) {
        return res.status(429).json({ error: 'Too Many Requests: Rate limit exceeded or free tier limits reached.' });
      }
      const errorText = await response.text();
      return res.status(502).json({ error: 'AI provider failed', details: errorText });
    }

    const data = await response.json();
    const rawContent = data.choices?.[0]?.message?.content;

    if (!rawContent) {
      return res.status(502).json({ error: 'Invalid response from AI provider (empty content).' });
    }

    // Clean up potential markdown formatting or conversational text
    let jsonString = rawContent.trim();
    
    // Extract JSON block if it's trapped inside markdown backticks
    const match = jsonString.match(/```(?:json)?\s*([\s\S]*?)\s*```/);
    if (match) {
      jsonString = match[1].trim();
    } else {
      // Try to find the first '{' and the last '}' to strip conversational padding
      const firstBrace = jsonString.indexOf('{');
      const lastBrace = jsonString.lastIndexOf('}');
      if (firstBrace !== -1 && lastBrace !== -1) {
         jsonString = jsonString.substring(firstBrace, lastBrace + 1);
      }
    }
    
    // Validate that it parses correctly
    const parsedJson = JSON.parse(jsonString);

    return res.json(parsedJson);

  } catch (error) {
    console.error('Error generating trip:', error);
    if (error instanceof SyntaxError) {
      return res.status(502).json({ error: 'AI provider returned invalid JSON format.' });
    }
    return res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Backend server running securely on port ${PORT}`);
});
