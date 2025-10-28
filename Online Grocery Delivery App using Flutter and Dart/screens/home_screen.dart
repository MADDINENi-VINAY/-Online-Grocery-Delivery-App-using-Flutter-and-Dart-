import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      appBar: AppBar(title: const Text('GrocerEase')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(products[i].name),
          subtitle: Text('\$${products[i].price}'),
          onTap: () => Navigator.of(context).pushNamed('/product'),
        ),
      ),
    );
  }
}
