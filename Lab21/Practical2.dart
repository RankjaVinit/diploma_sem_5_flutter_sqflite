import 'dart:convert';
class Product {
  final int id;
  final String title;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
    );
  }
}


void main() {
  Product p = Product(
    id: 1,
    title: "ABC",
    price: 1234
  );
  //
  Map pMap = p.toJson();
  //
  print(pMap);
  String pString = jsonEncode(pMap);
  //
  print(pString);
  //
  // // Convert JSON String -> Map
  Map<String, dynamic> productMap = jsonDecode(pString);
  //
  // Convert Map -> Product Model
  Product product = Product.fromJson(productMap);
  //
  print("Product Title: ${product.title}");
  print("Product Price: ${product.price}");
}

