class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final List<dynamic> images;
  final String createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0.0',
      images: json['images'] != null ? List<dynamic>.from(json['images']) : [],
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'created_at': createdAt,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    List<dynamic>? images,
    String? createdAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}