import 'package:flutter/material.dart';
import 'package:my_course_app/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  //140.2 ProductListPage(this.products, this.updateProduct);
  final Function delteProduct;
  ProductListPage(
      this.products, this.updateProduct, this.delteProduct); // 140.2

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return
            //139.1 drag and delete
            Dismissible(
          key: Key(products[index]['title']),
          background: Container(
            color: Colors.red,
          ),
          // 140.3
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              delteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print('Swiped start to end');
            } else {
              print('Other swiping');
            }
          }, //140.3
          child: // 139.1
              // 138.3
              Column(
            children: <Widget>[
              ListTile(
                leading:
                    //138.1 Image.asset(products[index]['image'])
                    CircleAvatar(
                  backgroundImage: AssetImage(products[index]['image']),
                ), // 138.1
                title: Text(products[index]['title']),
                // 138.2
                subtitle:
                    Text('\$${products[index]['price'].toString()}'), //138.2
                trailing: buildEditButton(context, index),
              ),
              // 138.4
              Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }

  IconButton buildEditButton(BuildContext context, int index) {
    return IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ProductEditPage(
                          product: products[index],
                          updateProduct: updateProduct,
                          productIndex: index,
                        );
                      },
                    ),
                  );
                },
              );
  }
}
