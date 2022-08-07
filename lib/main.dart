import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_products/providers/product_details_controller.dart';
import 'package:simple_products/screens/product_details/product_details_screen.dart';

import 'providers/product_list_controller.dart';
import 'screens/product_list/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductListController()),
        ChangeNotifierProvider.value(value: ProductDetailsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductList(),
        routes: {
          '/details': (context) => const ProductDetails(),
        },
      ),
    );
  }
}
