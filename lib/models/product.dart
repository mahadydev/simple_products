import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Product {
  int id;
  String? name;
  String? thumbnail_image;
  bool has_discount;
  String? stroked_price;
  String main_price;
  int rating;
  int sales;

  Product({
    required this.id,
    this.name,
    this.thumbnail_image,
    required this.has_discount,
    this.stroked_price,
    required this.main_price,
    required this.rating,
    required this.sales,
  });
  //de-serialization
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'thumbnail_image': thumbnail_image,
      'has_discount': has_discount,
      'stroked_price': stroked_price,
      'main_price': main_price,
      'rating': rating,
      'sales': sales,
    };
  }

  //serialization
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail_image: map['thumbnail_image'] != null
          ? map['thumbnail_image'] as String
          : null,
      has_discount: map['has_discount'] as bool,
      stroked_price:
          map['stroked_price'] != null ? map['stroked_price'] as String : null,
      main_price: map['main_price'] as String,
      rating: map['rating'] as int,
      sales: map['sales'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
