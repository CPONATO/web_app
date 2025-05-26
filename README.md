# 🛒 Shop App - Flutter E-commerce Application

A complete e-commerce mobile application built with Flutter featuring modern architecture and intuitive user interface.

## ✨ Key Features

### 🔐 User Authentication

- **Sign Up & Sign In**: Secure authentication system with JWT tokens
- **Session Management**: Automatic login state persistence
- **Account Deletion**: Allow users to permanently delete their accounts
- **Profile Updates**: Edit shipping address and personal information

### 🛍️ Shopping Experience

- **Product Browsing**: View products organized by categories and subcategories
- **Search Functionality**: Find products by name and description
- **Product Details**: Comprehensive product information, images, and ratings
- **Shopping Cart**: Add, remove, and update product quantities
- **Wishlist**: Save favorite products for later

### 📦 Order Management

- **Place Orders**: Create orders with shipping information
- **Order Tracking**: Monitor order status (Processing/Delivered)
- **Order History**: View and manage all past orders
- **Product Reviews**: Leave ratings and reviews for purchased items

### 🏪 Store Management

- **Vendor Listings**: Browse all available stores/vendors
- **Store Products**: View products from specific vendors
- **Store Information**: Detailed vendor and store information

### 📱 User Interface

- **Bottom Navigation**: Easy navigation between main screens
- **Responsive Design**: Optimized for various screen sizes
- **Modern UI**: Clean and intuitive design with smooth animations
- **Error Handling**: Comprehensive error states and loading indicators

## 🛠️ Technology Stack

### Frontend (Flutter)

- **Flutter SDK**: 3.7.2+
- **Dart**: Primary programming language
- **Riverpod**: Modern state management solution
- **HTTP**: API communication
- **SharedPreferences**: Local data storage

### Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.1.0
  http: ^1.2.1
  flutter_riverpod: ^2.5.1
  shared_preferences: ^2.2.3
```

### Backend Integration

- **RESTful API**: HTTP-based communication
- **JWT Authentication**: Token-based security
- **JSON**: Data exchange format

## 📁 Project Structure

```
lib/
├── controllers/           # Business logic handlers
│   ├── auth_controller.dart
│   ├── product_controller.dart
│   ├── order_controller.dart
│   ├── banner_controller.dart
│   ├── category_controller.dart
│   └── vendor_controller.dart
├── models/               # Data models
│   ├── user.dart
│   ├── product.dart
│   ├── order.dart
│   ├── category.dart
│   └── cart.dart
├── provider/             # State management (Riverpod)
│   ├── user_provider.dart
│   ├── cart_provider.dart
│   ├── favorite_provider.dart
│   ├── order_provider.dart
│   └── category_provider.dart
├── views/               # UI components
│   ├── screens/         # Main screens
│   │   ├── authentication_screens/
│   │   ├── nav_screens/
│   │   └── detail/
│   └── widgets/         # Reusable components
├── services/            # Utilities & services
└── global_variables.dart # Global configuration
```

## 🚀 Installation & Setup

### System Requirements

- Flutter SDK 3.7.2 or higher
- Dart SDK
- Android Studio / VS Code
- Android device/emulator or iOS device/simulator

### Step 1: Clone the repository

```bash
git clone <repository-url>
cd shop_app
```

### Step 2: Install dependencies

```bash
flutter pub get
```

### Step 3: Configure API endpoint

Open `lib/global_variables.dart` and update the API URL:

```dart
String uri = 'http://your-api-server.com';
```

### Step 4: Run the application

```bash
flutter run
```

## 🔧 Configuration

### API Configuration

The `global_variables.dart` file contains API endpoint configuration:

```dart
String uri = 'http://192.168.9.104:3000';  // Development
// String uri = 'https://your-production-api.com';  // Production
```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 📱 App Flow

### Main Screens

- **Home**: Featured banners, categories, and popular products
- **Categories**: Browse products by category and subcategory
- **Cart**: Shopping cart management
- **Favorites**: Saved favorite products
- **Stores**: Vendor listings and store products
- **Account**: User profile and order history

### User Journey

1. **Registration/Login** → **Browse Products** → **Add to Cart** → **Checkout** → **Track Orders**

## 🏗️ Architecture

### State Management

- **Riverpod**: Reactive and type-safe state management
- **Provider Pattern**: Separation of concerns between logic and UI
- **Immutable State**: Ensures data consistency across the app

### Data Flow

```
UI → Controller → API → Model → Provider → UI
```

### Local Storage Strategy

- **SharedPreferences**: Store authentication tokens, user info, and cart data
- **User-specific Storage**: Cart items saved per user ID
- **Persistent Sessions**: Automatic login restoration

## 🔒 Security Features

- **JWT Token Authentication**: Secure API communication
- **Input Validation**: Client-side data validation
- **Error Handling**: Graceful error management
- **Session Management**: Secure token storage and refresh

## 📋 Roadmap

### Upcoming Features

- [ ] Payment Integration (Stripe, PayPal)
- [ ] Push Notifications
- [ ] Offline Mode Support
- [ ] Social Authentication (Google, Facebook)
- [ ] Multi-language Support
- [ ] Advanced Product Filtering
- [ ] Live Chat Support
- [ ] Order Tracking with Maps
- [ ] Product Recommendations
- [ ] Inventory Management

### Performance Improvements

- [ ] Image Caching
- [ ] Lazy Loading
- [ ] Database Optimization
- [ ] API Response Caching

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow Flutter/Dart style guidelines
- Write unit tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 🐛 Bug Reports

If you encounter any bugs, please create an issue with:

- Detailed description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/OS information

## 🔗 Useful Links

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Best Practices](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)

## 📊 Stats

- **Lines of Code**: 10,000+
- **Screens**: 15+
- **Components**: 50+
- **API Endpoints**: 20+

## 🎯 Performance

- **App Size**: ~15MB
- **Startup Time**: <3 seconds
- **Smooth Animations**: 60fps
- **Memory Usage**: Optimized for mobile devices

---

**Made with ❤️ using Flutter & Dart**

_If you found this project helpful, please consider giving it a ⭐ star on GitHub!_
