import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  // 70.7 change to map
  // final List<String> products;
  final List<Map<String, String>> products; //70.7
  // 71.5
  final Function deleteProduct;

// 71.6 
  // Products([this.products = const []]) {
    Products(this.products, {this.deleteProduct}) {
    print('E: [Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          // 70.8
          // Image.asset('assets/food.jpg'),
          Image.asset(products[index]['image']),
          Text(products[index]['title']), //70.8
          // 67.1 adding btn for nav
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                /* 71.2.1 use then to get back information from pass data from detail view
                // 68.1 use navigator to navigate to other page
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 70.9
                        builder: (BuildContext context) => ProductPage(
                            products[index]['title'],
                            products[index]['image']), //70.9
                      ),
                ), 71.2.1 */
                /* 71.2.2 then is an object which allows you to listen to some future event and 
                we get back such a future from the push method and there we can add the then method.
                71.2.2*/
                onPressed: () => Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        // 70.9
                        builder: (BuildContext context) => ProductPage(
                            products[index]['title'],
                            products[index]['image']), //70.9
                      ),
                ).then((bool value) {
                  // 71.7
                  if (value){
                    deleteProduct(index);
                  } // 71.7
                  // print(value);

                }), // 71.2.2
              )
            ],
          ) //67.1
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
      /* collection view
      productCard = GridView.builder(itemBuilder: _buildProductItem,
      itemCount: products.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),); */
    } else {
      productCard = Center(
        child: Text('No products found, please add some'),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
