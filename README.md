## 📱 About the Project

**AI Trip Planner** is a modern, AI-powered mobile application built with **Flutter**, **Firebase**, and **AI services (OpenAI / Gemini)** to help users discover destinations, generate personalized travel itineraries, and manage trips through a clean and intuitive experience.

The app is designed using **clean architecture**, **feature-first modularization**, and **secure backend integration**, making it scalable, maintainable, and production-ready. All AI logic and payments are handled securely on the backend, while the Flutter app focuses on performance, UX, and responsiveness.

---

## 🚀 Key Features

- 🔐 **Authentication & Onboarding**
  - Email & Password authentication
  - Google Sign-In and Apple Sign-In (iOS)
  - First-time user onboarding and travel preference setup

- 🌍 **Discover Destinations & Articles**
  - Browse popular destinations
  - Read travel articles and guides
  - Search destinations and content

- 🤖 **AI-Powered Trip Planning**
  - Generate personalized, day-by-day itineraries
  - Customize trips by destination, budget, travelers, and interests
  - Smart balance between activities and rest
  - AI responses stored and rendered from structured JSON

- 🧳 **My Trips Management**
  - View, edit, regenerate, and delete trips
  - Persistent trip storage per user
  - Real-time updates using Firestore

- ⭐ **Saved Destinations**
  - Bookmark favorite places
  - Remove or manage saved destinations
  - Offline-friendly access where possible

- ⚙️ **Settings & Profile**
  - Manage travel preferences
  - Theme customization
  - Subscription and billing management
  - Account security options

- 💳 **Subscriptions & Payments**
  - Free and Pro plans
  - Monthly and yearly subscriptions
  - Secure Stripe payments
  - Feature-based access control

---

## 🧠 AI Architecture (Secure by Design)

All AI trip generation logic runs **exclusively inside Firebase Cloud Functions** to protect:
- API keys
- Prompt engineering logic
- Business rules

The mobile app never communicates directly with AI providers.

**Example AI Input**
```json
{
  "destination": "Tokyo",
  "days": 5,
  "budget": "mid-range",
  "travelers": "couple",
  "interests": ["culture", "food", "shopping"]
}
