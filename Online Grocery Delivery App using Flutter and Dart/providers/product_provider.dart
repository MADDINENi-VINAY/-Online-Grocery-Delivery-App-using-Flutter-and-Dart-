import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(id: '1', name: 'Apple', price: 1.2),
    ProductModel(id: '2', name: 'Banana', price: 0.8),
  ];

  List<ProductModel> get products => List.unmodifiable(_products);
}
