class ProductModel {
  final String? foodCode;
  final String? name;
  final String? picture;
  final String? pictureOri;
  final String? createdAt;
  final dynamic price;
  int qty;
  final int? id;

  ProductModel({
    required this.foodCode,
    required this.name,
    required this.picture,
    required this.pictureOri,
    required this.createdAt,
    required this.price,
    this.id,
    this.qty = 0,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'food_code': foodCode,
      'name': name,
      'picture': picture,
      'picture_ori': pictureOri,
      'created_at': createdAt,
      'price': price,
      'id': id,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      foodCode: map['food_code'],
      name: map['name'],
      picture: map['picture'],
      pictureOri: map['picture_ori'],
      createdAt: map['created_at'],
      price: map['price'],
      id: map['id'],
    );
  }

  ProductModel copyWith({
    String? foodCode,
    String? name,
    String? picture,
    String? pictureOri,
    String? createdAt,
    String? price,
    int? qty,
    int? id,
  }) {
    return ProductModel(
      foodCode: foodCode,
      name: name,
      picture: picture,
      pictureOri: pictureOri,
      createdAt: createdAt,
      price: price,
      qty: qty ?? this.qty,
      id: id,
    );
  }
}
