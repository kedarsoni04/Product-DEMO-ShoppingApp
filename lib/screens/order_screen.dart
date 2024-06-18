import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderScreen extends StatefulWidget {
  final Order order;

  const OrderScreen({super.key, required this.order});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 232, 255),
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: widget.order.items.length,
        itemBuilder: (context, index) {
          final product = widget.order.items[index];
          return ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  widget.order.removeOrder(product);
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
