import 'package:flutter/material.dart';
import 'models/product.dart';
import 'models/cart.dart';
import 'models/wishlist.dart';
import 'models/order.dart';
import 'screens/cart_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const ShoppingDemoApp());
}

class ShoppingDemoApp extends StatelessWidget {
  const ShoppingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 29.99),
    Product(id: '2', name: 'Product 2', price: 49.99),
    Product(id: '3', name: 'Product 3', price: 19.99),
    Product(id: '4', name: 'Product 4', price: 39.99),
    Product(id: '5', name: 'Product 5', price: 69.99),
    Product(id: '6', name: 'Product 6', price: 59.99),
  ];

  final Cart cart = Cart();
  final Wishlist wishlist = Wishlist();
  final Order order = Order();

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 232, 255),
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WishlistScreen(wishlist: wishlist)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderScreen(order: order)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Rs. ${product.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to cart')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    cart.removeFromCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${product.name} removed from cart')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    wishlist.addToWishlist(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${product.name} added to wishlist')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    order.placeOrder(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} order placed')),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
