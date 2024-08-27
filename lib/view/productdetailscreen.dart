import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/productData.dart';
import '../service/cartnotify.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Image.network(widget.product.image),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.title, style: TextStyle(fontSize: 24)),
                    SizedBox(height: 10),
                    Text('\$${widget.product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Text(widget.product.description),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    cartProvider.addToCart(widget.product);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
