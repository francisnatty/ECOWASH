class ProductByLocation {
  final bool success;
  final String message;
  final List<Product> data;
  final DateTime timestamp;

  ProductByLocation({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory ProductByLocation.fromJson(Map<String, dynamic> json) =>
      ProductByLocation(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List).map((e) => Product.fromJson(e)).toList(),
        timestamp: DateTime.parse(json['timestamp']),
      );
}

class Product {
  final int id;
  final String productId;
  final String name;
  final String vendorId;
  final String categoryId;
  final double price;
  final String description;
  final String imageUrl;
  final String status;
  final List<AddOn> addOns;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Vendor vendor;
  final Category category;

  Product({
    required this.id,
    required this.productId,
    required this.name,
    required this.vendorId,
    required this.categoryId,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.status,
    required this.addOns,
    required this.createdAt,
    required this.updatedAt,
    required this.vendor,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        productId: json['productId'],
        name: json['name'],
        vendorId: json['vendorId'],
        categoryId: json['categoryId'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        imageUrl: json['imageUrl'],
        status: json['status'],
        addOns: (json['addOns'] as List).map((e) => AddOn.fromJson(e)).toList(),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        vendor: Vendor.fromJson(json['vendor']),
        category: Category.fromJson(json['category']),
      );
}

class AddOn {
  final String name;
  final double price;
  final bool required;

  AddOn({
    required this.name,
    required this.price,
    required this.required,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        required: json['required'],
      );
}

class Vendor {
  final int id;
  final String vendorId;
  final String name;
  final String email;
  final String logoUrl;
  final String locationId;
  final String city;
  final String address;
  final Geolocation geolocation;
  final String openHours;
  final String closeHours;
  final double rating;
  final String businessApproval;
  final String businessActive;
  final bool subscription;
  final bool ecowashBlocked;
  final DateTime creationDate;
  final String modeOfDelivery;
  final List<String> collectionIds;
  final String? ownerId;
  final String? vendorUserId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Vendor({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.email,
    required this.logoUrl,
    required this.locationId,
    required this.city,
    required this.address,
    required this.geolocation,
    required this.openHours,
    required this.closeHours,
    required this.rating,
    required this.businessApproval,
    required this.businessActive,
    required this.subscription,
    required this.ecowashBlocked,
    required this.creationDate,
    required this.modeOfDelivery,
    required this.collectionIds,
    this.ownerId,
    this.vendorUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json['id'],
        vendorId: json['vendorId'],
        name: json['name'],
        email: json['email'],
        logoUrl: json['logoUrl'],
        locationId: json['locationId'],
        city: json['city'],
        address: json['address'],
        geolocation: Geolocation.fromJson(json['geolocation']),
        openHours: json['openHours'],
        closeHours: json['closeHours'],
        rating: (json['rating'] as num).toDouble(),
        businessApproval: json['businessApproval'],
        businessActive: json['businessActive'],
        subscription: json['subscription'],
        ecowashBlocked: json['ecowashBlocked'],
        creationDate: DateTime.parse(json['creationDate']),
        modeOfDelivery: json['modeOfDelivery'],
        collectionIds: List<String>.from(json['collectionIds']),
        ownerId: json['ownerId'],
        vendorUserId: json['vendorUserId'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );
}

class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation({
    required this.latitude,
    required this.longitude,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
      );
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
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
      );
}
