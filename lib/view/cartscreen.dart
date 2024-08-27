import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/cartnotify.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartProvider.cart.isEmpty
          ? Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: cartProvider.cart.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cart[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout or clear cart functionality if needed
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
