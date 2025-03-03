class CreateCollectionModel {
  final String collectionId;
  final String name;
  final String description;
  final String location;
  final List<String> images;
  final String backgroundColor;

  CreateCollectionModel({
    required this.collectionId,
    required this.name,
    required this.description,
    required this.location,
    required this.images,
    required this.backgroundColor,
  });

  Map<String, dynamic> toJson() {
    return {
      "collectionId": collectionId,
      "name": name,
      "description": description,
      "location": location,
      "images": images,
      "backgroundColor": backgroundColor,
    };
  }
}
