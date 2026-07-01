# FoodGo

A Flutter application.

## Prerequisites

Before running the project, make sure you have installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Git

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/your-username/foodgo.git
cd foodgo
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Create the Environment File

This project uses a **.env** file for storing API keys and other sensitive configuration.

Create a file named:

```
.env
```

in the project root.

Example:

```env
BASE_URL=https://your-api-url.com
API_KEY=your_api_key_here
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

> **Important**
>
> - The `.env` file is **not included** in this repository.
> - Never commit your `.env` file to GitHub.
> - Ask the project administrator for the required environment values.

### 4. Run the project

```bash
flutter run
```

## .gitignore

Make sure your `.gitignore` contains:

```gitignore
.env
.env.local
.env.development
.env.production
.env.staging
```

## Packages

If using `flutter_dotenv`, load the environment file:

```dart
await dotenv.load(fileName: ".env");
```

## Flutter Documentation

- https://docs.flutter.dev/
- https://docs.flutter.dev/get-started/install
