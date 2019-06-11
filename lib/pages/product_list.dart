import 'package:flutter/material.dart';
import 'package:my_course_app/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  //130.4
  final List<Map<String, dynamic>> products;
  //133.5 ProductListPage(this.products);
  final Function updateProduct;
  ProductListPage(this.products, this.updateProduct); //133.5

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(products[index]['image']),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // 131.2
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProductEditPage(
                      product: products[index],
                      //133.6
                      updateProduct: updateProduct,
                      productIndex: index, //133.6
                    );
                  },
                ),
              ); //131.2
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
