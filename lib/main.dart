import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service/cartnotify.dart';
import 'service/service.dart';
import 'view/cartscreen.dart';
import 'view/productlistscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Cart App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListScreen(),
        routes: {
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
