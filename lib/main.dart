import 'package:flutter/material.dart';
import './product_manager.dart';
import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //92.15.1 String tp dynamic
  List<Map<String, dynamic>> _products = [];
//92.15.2 String tp dynamic
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      routes: {
        /* 91.3 because we want to move the add product btn to create page let's 
      move it 
        '/': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductsAdminPage(),91.3*/
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements =
            settings.name.split('/'); // '/product/1'
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(
                _products)); // 92.16 , _addProduct, _deleteProduct));
      },
    );
  }
}

// 66.1 because we want navigate to other pages so we create "pages" subfolder
// 66.2 create home.dart file in pages subfolder
// 67.2 create deatil page product.dart
// 73.1 How If we want to push a new page but replace the existing one like auth page. So let's make auth.dart file
// 74 Adding the Slidedrawer
// 78 name route is like storyBoardKey in Xcode
/** 79 & 80 & 81 : what about we want to pass data through named routes? this method we show
 * here is complex and it just for simple app
 */
/** 82 when we don't return a route, then onUnknownRoute will run!
 * and this allows us to show some dummy fallback page for example.
 */
// 83 this lesson is about how add alert view
// 84 this lesson is about how add a modal view
// 88 this lesson is about how add a text edit got to product create page
/** 94 '_' at front of variable like private in swift
 * String _titleValue = '';
 */
// 95 how implement switch in flutter