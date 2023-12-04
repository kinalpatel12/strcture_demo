class ProductModel {
  List<Product>? products; // Use List<Product> for a list of products

  ProductModel({this.products});

  // Updated fromJson to handle a list of products
  factory ProductModel.fromJson(dynamic json) {
    if (json is List) {
      // If the response is a list, parse each item
      List<Product> productsList =
          json.map((item) => Product.fromJson(item)).toList();
      return ProductModel(products: productsList);
    } else if (json is Map<String, dynamic>) {
      // If the response is a single object, handle it accordingly
      return ProductModel(products: [Product.fromJson(json)]);
    } else {
      // Invalid JSON format
      throw FormatException('Invalid JSON format');
    }
  }
}

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  // Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    // this.rating,
  });

  // Add a factory method to parse JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      // rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  // Add toJson method if you need to convert the object back to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;

    return data;
  }
}
