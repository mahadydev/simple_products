import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_products/providers/product_list_controller.dart';

import '../../models/product.dart';
import '../../widgets/list_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    Provider.of<ProductListController>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductListController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Product product = productProvider.productList[index];
          return ListtileProductCard(product: product);
        },
        itemCount: productProvider.productList.length,
      ),
    );
  }
}
