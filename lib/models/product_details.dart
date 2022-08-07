import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDetails {
  String? name;
  String? thumbnail_image;
  String? description;
  ProductDetails({
    this.name,
    this.thumbnail_image,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'thumbnail_image': thumbnail_image,
      'description': description,
    };
  }

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail_image: map['thumbnail_image'] != null
          ? map['thumbnail_image'] as String
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetails.fromJson(String source) =>
      ProductDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
