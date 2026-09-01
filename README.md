<div align="center">

  # 🍔 Yummy Food Delivery

  **A modern, full-stack, cross-platform food delivery ecosystem built with Flutter, Dart Frog, and Node.js.**

  [![Flutter](https://img.shields.io/badge/Flutter-3.22.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.0.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![Dart Frog](https://img.shields.io/badge/Backend-Dart%20Frog-055399?style=for-the-badge&logo=dart&logoColor=white)](https://dartfrog.vgv.dev)
  [![Node.js](https://img.shields.io/badge/Server-Node.js%20%7C%20Stripe-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org)
  [![BLoC](https://img.shields.io/badge/Architecture-BLoC-02569B?style=for-the-badge)](https://bloclibrary.dev)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

  <p align="center">
    <a href="#-overview">Overview</a> •
    <a href="#-key-features">Key Features</a> •
    <a href="#%EF%B8%8F-system-architecture">Architecture</a> •
    <a href="#%EF%B8%8F-tech-stack">Tech Stack</a> •
    <a href="#-getting-started">Getting Started</a> •
    <a href="#-environment-setup">Environment Setup</a> •
    <a href="#-internal-packages-overview">Packages</a>
  </p>

---

</div>

## 📌 Overview

**Yummy Food Delivery** is an end-to-end, production-ready food delivery solution. Designed with a modular monorepo structure, it cleanly separates presentation, domain business logic, data repositories, and API services into reusable packages.

The repository includes:
1. **Mobile Application (`/lib`)**: Cross-platform Flutter app (iOS & Android) featuring state-of-the-art UI/UX, Google Maps live tracking, cart management, and Stripe payments integration.
2. **API Server (`/api`)**: High-performance Dart Frog backend handling routes, WebSockets for real-time order updates, data models, and authentication.
3. **Payments Paywall Server (`/server`)**: Dedicated Node.js & TypeScript microservice for secure Stripe payment intents and webhooks.
4. **Internal UI & Data Packages (`/packages`)**: 15 decoupled Dart packages for UI design system (`app_ui`), authentication clients, repositories, and device services.

---

## ✨ Key Features

### 🛵 Customer Experience
- 🔍 **Restaurant Discovery & Filtering**: Search by category, food type, rating, and delivery speed.
- 🍕 **Interactive Menus**: Browse item details, customize options/add-ons, and add items to cart seamlessly.
- 🛒 **Cart & Checkout**: Dynamic cart updates, promo codes, delivery address selection, and detailed price breakdown.
- 💳 **Stripe Payment Gateway**: Secure in-app credit card payments via Stripe SDK & backend paywall microservice.
- 📍 **Google Maps & Live Tracking**: Interactive location picker and real-time order status tracking on Google Maps.
- 🔔 **Push Notifications & WebSockets**: Instant updates on order progress (Received, Preparing, On the Way, Delivered).
- 🌙 **Dark & Light Mode Support**: Beautiful UI built with a custom design system inspired by Shadcn UI.

### ⚙️ Developer & Architectural Features
- 🧱 **Clean & Feature-First Monorepo**: Feature-based directory structure (`lib/src/`) backed by modular internal packages (`packages/`).
- ⚡ **BLoC State Management**: Predictable state flow using `flutter_bloc` and `hydrated_bloc` for persistent state.
- 🌐 **Dart Frog API & WebSockets**: Server-side Dart API serving REST endpoints and managing real-time WebSocket channels.
- 🐳 **Dockerized Backend**: Containerized backend setup with `docker-compose` for local development and cloud deployment.
- 🛡️ **Type-Safe Forms**: Robust validation using `formz` and custom form fields.

---

## 🏗️ System Architecture

```
                                  +-----------------------+
                                  |   Flutter Mobile App  |
                                  |   (iOS / Android)     |
                                  +-----------+-----------+
                                              |
                     +------------------------+------------------------+
                     |                                                 |
                     v                                                 v
        +-------------------------+                       +-------------------------+
        |   Dart Frog API Server  |                       |  Stripe Payment Server  |
        |  (REST API + WebSockets |                       |  (Node.js / Express /   |
        |    + Stormberry ORM)    |                       |   TypeScript)           |
        +-------------------------+                       +-------------------------+
```

### 📂 Repository Structure

```gomaa-dev/yummy-mobile
├── lib/                        # Flutter Application
│   ├── bootstrap.dart          # App bootstrap & global observer initialization
│   ├── main.dart               # App entrypoint
│   └── src/                    # Feature-first modular UI & state logic
│       ├── app/                # Root MaterialApp config & router
│       ├── auth/               # Authentication & login screens
│       ├── cart/               # Cart management & checkout
│       ├── home/               # Home screen, discovery & categories
│       ├── map/                # Google Maps integration & location picker
│       ├── menu/               # Restaurant menu & product details
│       ├── navigation/         # Bottom navigation & tab bar
│       ├── notifications/      # Notification handlers & UI
│       ├── orders/             # Order history & live order tracking
│       ├── payments/           # Stripe payment integration UI
│       ├── profile/            # User profile & settings
│       ├── restaurants/        # Restaurant details & listing
│       └── search/             # Multi-criteria search
│
├── api/                        # Dart Frog Backend API
│   ├── data/                   # Data sources & JSON mocks
│   ├── routes/                 # API endpoints & WebSocket handlers
│   ├── Dockerfile              # Docker container setup
│   └── docker-compose.yml      # Local service orchestration
│
├── server/                     # Stripe Payment Paywall Server
│   ├── src/                    # Express & TypeScript source code
│   └── package.json            # Node dependencies
│
└── packages/                   # Modular Internal Dart Packages
    ├── app_ui/                 # Design system, theme, & custom UI widgets
    ├── authentication_client/  # Firebase auth & token storage
    ├── env/                    # Environment variables manager
    ├── form_fields/            # Input validation models
    ├── location_repository/    # Location services & geocoding
    ├── notifications_client/   # FCM notification client
    ├── notifications_repository/# Notification domain logic
    ├── orders_repository/      # Order creation & tracking repository
    ├── payments_client/        # Stripe payment client wrapper
    ├── payments_repository/    # Payment domain logic
    ├── permission_client/      # Device permissions handling
    ├── restaurants_repository/ # Restaurant data & repository
    ├── shared/                 # Common models & utilities
    ├── storage/                # Key-value persistent storage
    └── user_repository/        # User data repository
```

---

## 🛠️ Tech Stack

| Domain | Technology | Description |
| :--- | :--- | :--- |
| **Mobile Framework** | [Flutter](https://flutter.dev) `^3.22.0` | Cross-platform mobile development (iOS & Android) |
| **Language** | [Dart](https://dart.dev) `^3.0.0` | Primary language for app and Dart Frog backend |
| **State Management** | [flutter_bloc](https://bloclibrary.dev) | BLoC pattern for predictable state management |
| **Routing** | [go_router](https://pub.dev/packages/go_router) | Declarative navigation routing |
| **UI Design System** | Custom `app_ui` + [shadcn_ui](https://pub.dev/packages/shadcn_ui) | Modern, customizable UI component library |
| **Maps & Location** | [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) | Interactive Google Maps rendering & location tracking |
| **Backend API** | [Dart Frog](https://dartfrog.vgv.dev) | High performance Dart server framework & WebSockets |
| **Payment Server** | [Node.js](https://nodejs.org) + [Express](https://expressjs.com) + [TypeScript](https://www.typescriptlang.org) | Secure backend for Stripe payment processing |
| **Payment Gateway** | [Stripe](https://stripe.com) (`flutter_stripe` & `stripe-node`) | End-to-end card payment processing |
| **Authentication** | [Firebase Auth](https://firebase.google.com/docs/auth) | Secure user authentication & token storage |

---

## 📦 Internal Packages Overview

The project follows a **Monorepo Architecture**, dividing capabilities into standalone packages inside `/packages`:

- 🎨 **`app_ui`**: Reusable design system, colors, typography, buttons, cards, and theme data.
- 🔑 **`authentication_client`**: Abstract & Firebase authentication clients with token storage mechanisms.
- 📍 **`location_repository`**: Location fetcher, reverse geocoding, and place search.
- 🛍️ **`orders_repository`**: Handles order creation, fetching past orders, and tracking status.
- 💳 **`payments_repository` & `payments_client`**: Integrates payment intent generation with Stripe.
- 🍽️ **`restaurants_repository`**: Fetches categories, restaurant details, menu items, and reviews.
- 🔀 **`shared`**: Common data structures, models, and shared utilities across packages.

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your environment:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (`>= 3.22.0`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.0.0`)
- [Node.js](https://nodejs.org/) (`>= 20.6.0`) & `npm`
- [Docker](https://www.docker.com/) & Docker Compose (optional, for running the API containerized)
- [Dart Frog CLI](https://dartfrog.vgv.dev/docs/overview): `dart pub global activate dart_frog_cli`

---

### 1. Clone the Repository

```bash
git clone https://github.com/gomaa-dev/yummy-mobile.git
cd yummy-mobile
```

---

### 2. Set Up the Mobile Application

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Generate environment configuration** (if needed):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Run on iOS / Android**:
   ```bash
   flutter run
   ```

---

### 3. Set Up the Dart Frog API Server

1. Navigate to the API directory:
   ```bash
   cd api
   ```

2. Install dependencies:
   ```bash
   dart pub get
   ```

3. Start the API server locally:
   ```bash
   dart_frog dev
   ```
   *The API will start at `http://localhost:8080`.*

4. *(Optional)* Run via Docker:
   ```bash
   docker-compose up --build
   ```

---

### 4. Set Up the Stripe Payment Server

1. Navigate to the server directory:
   ```bash
   cd server
   ```

2. Install Node dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```
   *The payment server will listen on port `3000`.*

---

## 🔐 Environment Setup

Create `.env` files for the respective layers:

### Root / Mobile `.env` (`packages/env/`)
```env
API_BASE_URL=http://localhost:8080
STRIPE_PUBLISHABLE_KEY=pk_test_...
GOOGLE_MAPS_API_KEY=AIzaSy...
```

### Payment Server `.env` (`server/.env`)
```env
PORT=3000
STRIPE_SECRET_KEY=sk_test_...
```

---

## 🧪 Testing & Code Quality

Run tests across the project:

```bash
# Run Flutter app tests
flutter test

# Run Dart Frog API tests
cd api && dart test

# Run Static Analysis
flutter analyze
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check out the [Issues](../../issues) page.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📜 License

Distributed under the MIT License. See [`LICENSE`](file:///H:/Protofolio/Yummy/yummy/LICENSE) for more information.

---

<div align="center">
  Developed with ❤️ by <a href="https://github.com/gomaa-dev">Gomaa Dev</a>
</div>
