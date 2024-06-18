import 'package:flutter/material.dart';
import '../models/wishlist.dart';

class WishlistScreen extends StatefulWidget {
  final Wishlist wishlist;

  const WishlistScreen({super.key, required this.wishlist});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 232, 255),
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: widget.wishlist.items.length,
        itemBuilder: (context, index) {
          final product = widget.wishlist.items[index];
          return ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  widget.wishlist.removeFromWishlist(product);
                });
              },
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
          );
        },
      ),
    );
  }
}
