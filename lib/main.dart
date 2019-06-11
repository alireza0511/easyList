import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  // 47.2 this variable help to see the ui elements
  // debugPaintSizeEnabled = true;
  // 48.1 show text base line
  // debugPaintBaselinesEnabled = true;
  // 48.2 This shows you where the tap event is registered
  // debugPaintPointersEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  // 133.1 add update method
  void _updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      _products[index] = product;
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
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        // 102.4
        // fontFamily: 'Oswald' //102.4
        // 119.1
        buttonColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            //130.1 ProductsAdminPage(_addProduct, _deleteProduct),
            // 133.2 ProductsAdminPage(_addProduct, _deleteProduct, _products), //130.1
            ProductsAdminPage(
                _addProduct, _updateProduct, _deleteProduct, _products) //133.2
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'],
                _products[index]['image'],
                // assignment 5
                _products[index]['description'],
                _products[index]['price']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
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
// 103. Working with Rows
/* 111. Outsourcing Code into Separate Widgets make a 'widgets' folder 
then create a 'products' subfolder then move products.dart from main folder
to products subfolder*/
// 117 make our auth page responsible for landscape mode
// 130 implement product_list page
// 131 we want to use create page as Edit page let's change the name product_create.dart to product_edit.dart
// 133 update product when we edit
// 134 make our textfeild focusable let create "helper" folder,