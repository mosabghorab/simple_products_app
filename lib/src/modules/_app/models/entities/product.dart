class Product {
  String? name;
  num? price;
  List<String>? images;
  String? storeName;
  String? categoryName;

  Product({
    required this.name,
    required this.price,
    required this.images,
    required this.storeName,
    required this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        name: data['name'],
        price: data['price'],
        images: data['images'].map<String>((e) => e.toString()).toList(),
        storeName: data['storeName'],
        categoryName: data['categoryName'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'images': images,
        'storeName': storeName,
        'categoryName': categoryName,
      };
}
