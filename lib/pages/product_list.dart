import 'package:flutter/material.dart';
import 'package:my_course_app/pages/product_edit.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  /*150.19 
  //145.10 final List<Map<String, dynamic>> products;
  final List<Product> products;
  final Function updateProduct;
  final Function delteProduct;
  ProductListPage(this.products, this.updateProduct, this.delteProduct); 150.19*/

  @override
  Widget build(BuildContext context) {
    return
        // 150.20
        ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return //150.20
            ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),//150.21 Key(products[index].title), //['title']),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct(); // 150.21 delteProduct(index);
                } else if (direction == DismissDirection.startToEnd) {
                  print('Swiped start to end');
                } else {
                  print('Other swiping');
                }
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                         AssetImage(model.products[index].image), //150.21 AssetImage(products[index].image), //['image']),
                    ),
                    title: Text(model.products[index].title), //150.21 Text(products[index].title), //['title']),
                    subtitle: Text('\$${model.products[index].price.toString()}'), //150.21 Text('\$${products[index].price.toString()}'),
                    trailing: _buildEditButton(context, index, model), //150.24 _buildEditButton(context, index),
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: model.products.length,//150.21 products.length,
        );
      },
    );
  }

  // 150.23 Widget _buildEditButton(BuildContext context, int index) {
    Widget _buildEditButton(BuildContext context, int index, ProductsModel model) {
    /*150.22 
    return
        
        // 150.5 we need access selectedProduct Func from our model scoped
        ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) { 150.22*/
        return // 150.5
            IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // 150.6
            model.selectProduct(index);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return ProductEditPage(

                      /* 150.4 product: products[index],
                updateProduct: updateProduct,
                productIndex: index, */
                      );
                },
              ),
            );
          },
        );
      // 150.22 },
    // 150.22 );
  }
}
