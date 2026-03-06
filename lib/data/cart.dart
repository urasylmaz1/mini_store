import '../models/product.dart';

class Cart {
  static List<Product> items = [];

  static double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^\d.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  static double get totalPrice {
    return items.fold(
      0.0,
      (sum, item) => sum + _parsePrice(item.price),
    );
  }

  static void remove(Product product) {
  items.remove(product);
}
}