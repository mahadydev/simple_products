import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_products/providers/product_details_controller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    Provider.of<ProductDetailsController>(context, listen: false).detail = null;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    int? id = ModalRoute.of(context)?.settings.arguments as int;
    Provider.of<ProductDetailsController>(context, listen: false)
        .getDetails(id);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<ProductDetailsController>(context);

    return Scaffold(
      appBar: AppBar(),
      body: detailsProvider.detail == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                if (detailsProvider.detail?.thumbnail_image != null)
                  Image.network(detailsProvider.detail?.thumbnail_image ?? ''),
                //observable variable
                Text(detailsProvider.detail?.name ?? ''),

                Text(detailsProvider.detail?.description ?? ''),
              ],
            ),
    );
  }
}
