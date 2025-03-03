class GetCollectionModel {
  final bool success;
  final String message;
  final List<Collection> data;
  final String timestamp;

  GetCollectionModel({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory GetCollectionModel.fromJson(Map<String, dynamic> json) {
    return GetCollectionModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => Collection.fromJson(item))
          .toList(),
      timestamp: json['timestamp'],
    );
  }
}

class Collection {
  final int id;
  final String collectionId;
  final String name;
  final String status;
  final String description;
  final String location;
  final String backgroundColor;
  final String image;

  Collection({
    required this.id,
    required this.collectionId,
    required this.name,
    required this.status,
    required this.description,
    required this.location,
    required this.backgroundColor,
    required this.image,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      collectionId: json['collectionId'],
      name: json['name'],
      status: json['status'],
      description: json['description'],
      location: json['location'],
      backgroundColor: json['backgroundColor'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'name': name,
      'status': status,
      'description': description,
      'location': location,
      'backgroundColor': backgroundColor,
      'image': image,
    };
  }
}
