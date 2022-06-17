import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shop_express/app/injection_container.dart';
import 'package:shop_express/presentation/features/products/mobx/product.store.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductStore productStore;

  @override
  void initState() {
    productStore = sl<ProductStore>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    productStore = sl<ProductStore>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productStore.products.length,
              itemBuilder: (context, index) {
                final prod = productStore.products[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(prod.description),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.red,
                          child: Text('Add'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
