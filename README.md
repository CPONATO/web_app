# Flutter Web Admin Application

A comprehensive admin dashboard built with Flutter Web for managing an e-commerce platform. This application provides administrative controls for managing vendors, buyers, products, categories, orders, and banners.

## 🚀 Features

### Core Management Modules

- **👥 Vendor Management**: View, manage, and delete vendor accounts
- **🛍️ Buyer Management**: Monitor and manage customer accounts
- **📦 Product Management**: Comprehensive product catalog management
- **🏷️ Category Management**: Create and manage product categories with images and banners
- **🔖 Subcategory Management**: Organize products with detailed subcategories
- **📋 Order Management**: Track and manage customer orders
- **🎨 Banner Management**: Upload and manage promotional banners

### Key Capabilities

- **Image Upload**: Cloudinary integration for seamless image management
- **Responsive Design**: Optimized for web-based administration
- **Real-time Data**: Dynamic data loading with proper error handling
- **User-friendly Interface**: Clean, intuitive admin interface using Material Design

## 🛠️ Tech Stack

- **Framework**: Flutter Web
- **Language**: Dart
- **UI Library**: Material Design, Flutter Admin Scaffold
- **Image Storage**: Cloudinary
- **HTTP Client**: dart:http
- **File Handling**: file_picker

## 📋 Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK
- Web browser (Chrome, Firefox, Safari, Edge)
- Active internet connection for Cloudinary integration

## ⚙️ Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd web_ap
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Backend URL**

   Update the backend API URL in `lib/global_variable.dart`:

   ```dart
   // For production
   String uri = 'https://your-backend-api.herokuapp.com';

   // For development
   String uri = 'http://localhost:3000';
   ```

4. **Configure Cloudinary**

   Update Cloudinary credentials in the controller files:

   ```dart
   final cloudinary = CloudinaryPublic("your-cloud-name", 'your-upload-preset');
   ```

5. **Run the application**
   ```bash
   flutter run -d chrome
   ```

## 🏗️ Project Structure

```
lib/
├── controllers/          # Business logic and API calls
│   ├── banner_controller.dart
│   ├── buyer_controller.dart
│   ├── category_controller.dart
│   ├── order_controller.dart
│   ├── product_controller.dart
│   ├── subcategory_controller.dart
│   └── vendor_controller.dart
├── models/              # Data models
│   ├── banner.dart
│   ├── buyer.dart
│   ├── category.dart
│   ├── order.dart
│   ├── product.dart
│   ├── subcategory.dart
│   └── vendor.dart
├── services/            # Utility services
│   └── manage_http_response.dart
├── views/               # UI components
│   ├── main_screen.dart
│   ├── side_bar_screens/
│   │   ├── banner_screen.dart
│   │   ├── buyers_screen.dart
│   │   ├── category_screen.dart
│   │   ├── orders_screen.dart
│   │   ├── product_screen.dart
│   │   ├── subcategory_screen.dart
│   │   ├── vendors_screen.dart
│   │   └── widgets/     # Reusable UI widgets
│   └── ...
├── global_variable.dart # Global configuration
└── main.dart           # Application entry point
```

## 🔧 Configuration

### Backend API Endpoints

The application expects the following API endpoints:

- `GET /api/vendors` - Fetch all vendors
- `DELETE /api/vendors/:id` - Delete vendor
- `GET /api/users` - Fetch all buyers
- `GET /api/products` - Fetch all products
- `GET /api/categories` - Fetch all categories
- `POST /api/categories` - Create new category
- `GET /api/subcategories` - Fetch all subcategories
- `POST /api/subcategories` - Create new subcategory
- `GET /api/orders` - Fetch all orders
- `GET /api/banner` - Fetch all banners
- `POST /api/banner` - Upload new banner

### Environment Variables

Set up the following environment variables or update directly in code:

- **CLOUDINARY_CLOUD_NAME**: Your Cloudinary cloud name
- **CLOUDINARY_UPLOAD_PRESET**: Your Cloudinary upload preset
- **BACKEND_API_URL**: Your backend API base URL

## 🎯 Usage

### Accessing the Admin Dashboard

1. Launch the application in your web browser
2. Navigate through different sections using the sidebar menu
3. Each section provides specific management capabilities:

### Managing Categories

- Upload category images and banners
- Create new categories with names and visuals
- View existing categories in a grid layout

### Managing Subcategories

- Select parent categories from dropdown
- Upload subcategory images
- Organize products with detailed classification

### Managing Vendors

- View vendor information in tabular format
- Delete vendors with confirmation dialog
- Monitor vendor activity and details

### Managing Orders

- Track order status (Processing/Delivered)
- View customer and product details
- Monitor order quantities and pricing

## 🔍 Key Features Explained

### Image Upload System

- Integrated with Cloudinary for reliable image storage
- Supports multiple image formats
- Automatic image optimization and CDN delivery

### Responsive Data Tables

- Dynamic loading with FutureBuilder
- Error handling and loading states
- Efficient data rendering for large datasets

### Admin Navigation

- Sidebar navigation with route management
- Screen state management with StatefulWidget
- Clean separation of concerns

## 🚨 Error Handling

The application includes comprehensive error handling:

- HTTP response status management
- User-friendly error messages via SnackBar
- Loading states for better UX
- Graceful fallbacks for network issues

## 🔒 Security Considerations

- Ensure backend API implements proper authentication
- Validate file uploads on both client and server
- Implement rate limiting for API endpoints
- Use HTTPS in production environment

## 🌐 Deployment

### Web Deployment

```bash
flutter build web --release
```

Deploy the generated `build/web` folder to your preferred hosting service:

- Firebase Hosting
- Netlify
- Vercel
- Traditional web servers

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## 📝 Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_admin_scaffold: ^1.2.0
  file_picker: ^8.0.5
  http: ^1.2.1
  cloudinary_public: ^0.23.1

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^5.0.0
```

**Note**: This admin dashboard is designed to work with a compatible backend API. Ensure your backend implements the required endpoints and follows the expected data formats defined in the model classes.
