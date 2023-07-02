class Product {
  int id;
  String title;
  String price;
  String category;
  String description;
  String image;
  String rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: json['rating']['rate'].toString());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
