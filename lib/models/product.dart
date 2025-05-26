import 'dart:convert';

class Product {
  final String id;
  final String productName;
  final int productPrice;
  final int quantity;
  final String description;
  final String category;
  final String subCategory;
  final List<String> images;
  final String vendorId;
  final bool popular;
  final bool recommend;

  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.description,
    required this.category,
    required this.subCategory,
    required this.images,
    required this.vendorId,
    required this.popular,
    required this.recommend,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'productPrice': productPrice,
      'quantity': quantity,
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'images': images,
      'vendorId': vendorId,
      'popular': popular,
      'recommend': recommend,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] as String? ?? "",
      productName: map['productName'] as String? ?? "",
      productPrice: map['productPrice'] as int? ?? 0,
      quantity: map['quantity'] as int? ?? 0,
      description: map['description'] as String? ?? "",
      category: map['category'] as String? ?? "",
      subCategory: map['subCategory'] as String? ?? "",
      images: List<String>.from(map['images'] ?? []),
      vendorId: map['vendorId'] as String? ?? "",
      popular: map['popular'] as bool? ?? false,
      recommend: map['recommend'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}
