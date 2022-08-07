import 'package:flutter/material.dart';
import 'package:simple_products/models/product.dart';

class ListtileProductCard extends StatelessWidget {
  const ListtileProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //       builder: (context) => const ProductDetails()),
          // );
          Navigator.of(context).pushNamed('/details', arguments: product.id);
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(product.thumbnail_image ?? ''),
        ),
        title: Text(product.name ?? ''),
        trailing: Text(product.main_price.toString()),
        subtitle: Text('Rating : ${product.rating}, Sales : ${product.sales}'),
      ),
    );
  }
}
