class Product {
  final int id;
  final String name;
  final double? price;
  final int? stock;
  final String? barcode;
  final bool? isSale;
  final DateTime? createdDate;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.stock,
    this.barcode,
    this.isSale,
    this.createdDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      barcode: json['barcode'],
      isSale: json['is_sale'],
      createdDate: json['created_date'] != null
          ? DateTime.parse(json['created_date'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'barcode': barcode,
      'is_sale': isSale,
      'created_date': createdDate?.toIso8601String(),
    };
  }
}
