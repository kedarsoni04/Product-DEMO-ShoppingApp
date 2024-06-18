import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 232, 255),
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (context, index) {
          final product = widget.cart.items[index];
          return Column(
            children: [
              ListTile(
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {
                      widget.cart.removeFromCart(product);
                    });
                  },
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
