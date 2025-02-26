class Item {
  final String productTitle;
  final List<String> productImage;
  final num productPrice;
  final List<String> productFeatures;
  final String productDescription;
  final double rating;
  final int reviews;
  final String date;

  Item({
    required this.productTitle,
    required this.productImage,
    required this.productPrice,
    required this.productFeatures,
    required this.productDescription,
    required this.rating,
    required this.reviews,
    required this.date,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      productTitle: json['product_title'] as String,
      productImage: List<String>.from(json['product_image']),
      productPrice: json['product_price'],
      productFeatures: List<String>.from(json['product_features']),
      productDescription: json['product_description'] as String,
      rating: json['rating'] as double,
      reviews: json['reviews'],
      date: json['date'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'product_title': productTitle,
      'product_image': productImage,
      'product_price': productPrice,
      'product_features': productFeatures,
      'product_description': productDescription,
      'rating': rating,
      'reviews': reviews,
      'date': date,
    };
  }
}
