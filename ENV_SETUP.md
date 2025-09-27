# Environment Variables Setup

This project uses environment variables to manage sensitive configuration data like database credentials and Firebase API keys. This approach keeps sensitive information secure and prevents it from being accidentally committed to version control.

## Setup Instructions

1. **Copy the example file:**

   ```bash
   cp .env.example .env
   ```

2. **Edit the `.env` file** with your actual values:

   ```bash
   # Database Configuration
   DB_HOST=your_actual_db_host
   DB_PORT=3306
   DB_NAME=your_actual_db_name
   DB_USERNAME=your_actual_db_username
   DB_PASSWORD=your_actual_db_password

   # App Configuration
   APP_NAME=Javilla
   APP_VERSION=1.0.0

   # API Endpoints
   BASE_URL=https://api.javilla.com

   # Firebase Configuration
   FIREBASE_API_KEY=your_firebase_api_key
   FIREBASE_APP_ID=your_firebase_app_id
   FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id
   FIREBASE_PROJECT_ID=your_project_id
   FIREBASE_STORAGE_BUCKET=your_storage_bucket
   ```

## Important Notes

- **Never commit the `.env` file** to version control - it's already added to `.gitignore`
- **Always commit the `.env.example` file** - this serves as a template for other developers
- **Keep your `.env` file secure** and don't share it publicly
- **Firebase API keys are sensitive** - treat them like passwords and never expose them in code or logs

## Environment Variables Used

| Variable | Description | Example |
|----------|-------------|---------|
| `DB_HOST` | Database server hostname/IP | `localhost` |
| `DB_PORT` | Database port number | `3306` |
| `DB_NAME` | Database name | `myapp_db` |
| `DB_USERNAME` | Database username | `db_user` |
| `DB_PASSWORD` | Database password | `secure_password` |
| `APP_NAME` | Application name | `Javilla` |
| `APP_VERSION` | Application version | `1.0.0` |
| `BASE_URL` | API base URL | `https://api.example.com` |
| `FIREBASE_API_KEY` | Firebase API key | `AIzaSyBbBv1sFy6R...` |
| `FIREBASE_APP_ID` | Firebase app ID | `1:942149431655:android:...` |
| `FIREBASE_MESSAGING_SENDER_ID` | Firebase messaging sender ID | `942149431655` |
| `FIREBASE_PROJECT_ID` | Firebase project ID | `your-project-id` |
| `FIREBASE_STORAGE_BUCKET` | Firebase storage bucket | `your-project.firebasestorage.app` |

## Development Workflow

1. Clone the repository
2. Copy `.env.example` to `.env`
3. **Copy `android/app/google-services.example.json` to `android/app/google-services.json`**
4. Fill in your environment-specific values in both files
5. Run `flutter pub get` to install dependencies
6. Start development

## Firebase Configuration Setup

### Getting Your Firebase Config Files

1. **Go to [Firebase Console](https://console.firebase.google.com/)**
2. **Select your project** (or create a new one)
3. **Click on "Project Settings"** (gear icon)
4. **In the "General" tab**, scroll down to "Your apps"
5. **Click on the Android app** or add a new Android app
6. **Download the `google-services.json`** file
7. **Place it in `android/app/google-services.json`**

### Security Notes for google-services.json

- **This file contains sensitive Firebase configuration**
- **Never commit `google-services.json` to version control**
- **Always use `google-services.example.json` as a template for other developers**
- **Each developer needs their own copy from Firebase Console**

## Firebase Configuration

To get your Firebase configuration values:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to Project Settings (gear icon)
4. Scroll down to "Your apps" section
5. Select your Android app
6. Copy the configuration values to your `.env` file

**Note**: The `firebase_options.dart` file now loads values from environment variables instead of hardcoded values for security.

## Production Deployment

For production environments, ensure that environment variables are properly configured in your deployment platform (Firebase, AWS, etc.) rather than using the `.env` file.
