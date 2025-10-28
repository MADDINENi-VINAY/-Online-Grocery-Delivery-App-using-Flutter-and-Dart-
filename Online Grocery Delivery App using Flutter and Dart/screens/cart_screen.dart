import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<CartProvider>(context).items;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) => ListTile(
          title: Text('Item ${items[i].productId}'),
          subtitle: Text('Qty: ${items[i].quantity}'),
        ),
      ),
    );
  }
}
