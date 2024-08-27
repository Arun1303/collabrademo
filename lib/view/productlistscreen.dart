import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/service.dart';
import 'itemlist.dart';
import 'productdetailscreen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await productProvider.fetchProducts();
        },
        child: FutureBuilder(
            future: productProvider.fetchProducts(),
            builder: (context, data) {
              return ShopItemListing(
                items: productProvider.products,
              );
            }),
      ),
    );
  }
}
