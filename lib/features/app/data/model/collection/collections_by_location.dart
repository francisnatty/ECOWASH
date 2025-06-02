class CollectionByLocation {
  final bool success;
  final String message;
  final List<Category> data;
  final DateTime timestamp;

  CollectionByLocation({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory CollectionByLocation.fromJson(Map<String, dynamic> json) {
    return CollectionByLocation(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List).map((e) => Category.fromJson(e)).toList(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class Category {
  final int id;
  final String categoryId;
  final String categoryName;
  final List<String> collectionId;
  final String? description;
  final String categoryType;
  final String? vendorId;
  final String status;
  final String locationId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Product> products;
  final List<Service> services;

  Category({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.collectionId,
    this.description,
    required this.categoryType,
    this.vendorId,
    required this.status,
    required this.locationId,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
    required this.services,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      collectionId: List<String>.from(json['collectionId']),
      description: json['description'],
      categoryType: json['categoryType'],
      vendorId: json['vendorId'],
      status: json['status'],
      locationId: json['locationId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      products:
          (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
      services:
          (json['services'] as List).map((e) => Service.fromJson(e)).toList(),
    );
  }
}

class Service {
  final String serviceId;
  final String name;
  final double price;
  final String imageUrl;

  Service({
    required this.serviceId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['serviceId'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}

class Product {
  final String productId;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}
