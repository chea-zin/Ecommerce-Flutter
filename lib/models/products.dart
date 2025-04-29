// lib/models/product.dart

class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final String price;


  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,

  });

  // Optional: Add a factory constructor for JSON deserialization
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],

      title: json['name'],
      image: json['image_url'],
      description: json['description'],
      price: json['price'],
    );
  }

  // Optional: Add a method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'image': image,
      'description': description
    };
  }
}