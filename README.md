# Ylham Motors

A Flutter-based e-commerce mobile application for automotive parts and services marketplace in Turkmenistan.

## Features

- **Product Browsing** - Browse products across categories (motors, spare parts, services)
- **Brand Shopping** - View and shop by brands
- **Shopping Cart** - Add items, update quantities, manage cart
- **Checkout** - Complete purchases with address and payment selection
- **Order Management** - View order history and track orders
- **Favorites** - Save products to wishlist
- **Address Management** - Manage delivery addresses
- **User Authentication** - Phone-based OTP login/registration
- **Multi-language Support** - Turkmen localization

## Architecture

The app follows **Clean Architecture** with **BLoC state management**:

```
lib/
├── auth/                 # Authentication (login, register, OTP)
├── home/                 # Main dashboard with banners and categories
├── products/             # Product listings and filtering
├── categories/           # Category browsing
├── brands/               # Brand-based shopping
├── cart/                 # Shopping cart management
├── checkout/             # Order placement workflow
├── orders/               # Order history
├── favorites/            # Wishlist functionality
├── addresses/            # Delivery address management
├── detailed_product/     # Product detail view
├── masters/              # Service providers listing
├── profile/              # User account management
├── navigation/           # Bottom tab navigation
├── language/             # Language switching
├── l10n/                 # Localization files
└── main/                 # App bootstrap and entry point

packages/
├── app_ui/               # Shared UI components and theming
└── data_provider/        # HTTP clients, models, repositories
```

## Tech Stack

- **State Management**: flutter_bloc, hydrated_bloc
- **Networking**: Dio
- **Local Storage**: Hive, SharedPreferences, SecureStorage
- **UI**: Material Design 3, ScreenUtil, Phosphor Icons
- **Notifications**: Firebase Messaging (FCM)
- **Localization**: flutter_localizations, intl

## Getting Started

### Prerequisites

- Flutter SDK (3.x)
- Dart SDK
- Android Studio / VS Code

### Installation

```bash
# Get dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run --target=lib/main/main.dart
```

### Build

```bash
# Build APK
flutter build apk --target=lib/main/main.dart

# Build App Bundle (for Play Store)
flutter build appbundle --target=lib/main/main.dart
```

## Configuration

### Signing (Release builds)

Create `android/key.properties`:

```properties
storePassword=<your-password>
keyPassword=<your-key-password>
keyAlias=<your-key-alias>
storeFile=<path-to-keystore.jks>
```

## Version

Current version: 1.0.4+5
