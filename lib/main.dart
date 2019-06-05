import 'package:flutter/material.dart';
import './product_manager.dart';
import 'package:flutter/rendering.dart';
/* 73.5 
// 66.4
import './pages/products.dart'; 73.5*/
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  runApp(MyApp());
}

//80.1.1
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//80.1.2
class _MyAppState extends State<MyApp> {
  //80.2
  List<Map<String, String>> _products = [];

  //80.3 cut/copy
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  } // 80.3

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      /* 78.4.1
      home: AuthPage(), 78.4.1 */
      // 78.1
      routes: {
        // 80.6
        /**78.4 we can not use '/' as route name, this is actually a special 
         * name, that serves as your home route. if I comment home out here, 
         * it does work though. 78.4*/
        // '/': (BuildContext context) => ProductsPage(), 80.6
        '/': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        // 78.2.1
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      /** 79.1 it use for passing data with named routes 
       * onGenerateRoute is executed when we navigate to a named route which is not 
       * registered in our route registry.
      */
      onGenerateRoute: (RouteSettings settings) {
        // 79.3
        final List<String> pathElements =
            settings.name.split('/'); // '/product/1'
        //79.4
        if (pathElements[0] != '') {
          return null;
        }
        //79.5
        if (pathElements[1] == 'product') {
          //79.6
          final int index = int.parse(pathElements[2]);
          /*81.4 
          // 79.2 cut/past
          return MaterialPageRoute( */
          return MaterialPageRoute<bool>(
            // 81.4
            // 70.9
            builder: (BuildContext context) => ProductPage(
                // 80.5 products => _products
                _products[index]['title'],
                _products[index]['image']), //70.9
          ); // 79.2
        }
        // 79.7
        return null;
      },
      //82.1
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products, _addProduct, _deleteProduct));
      }, //82.1
    );
  }
}

/* 80.1 we need to move Product from ProductManager into the main.dart file. because we 
need to pass the through onGenerateRoute so let's chenge MyApp calss stateful wefget 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      /* 78.4.1
      home: 
      /* 66.3 cut/copy the from main.dart
      Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        /* 32.5 now we can pass our value to statful widget here 
        //31.14 let's call ProductManager as body of scaffold widget, create an object based on it by adding parentheses.
        body: ProductManager(), 32.5*/
        /* 36.2 
        body: ProductManager('Food Tester'), 36.2*/
        /* 60.3
        body: ProductManager(startingProduct:'Food Tester'), */
        body: ProductManager(),
      ), 66.3 */ 
      /* 73.6 use auth pas as defualt starting page
      // 66.5
      HomePage(), 73.6*/
       
      AuthPage(), 78.4.1 */
      // 78.1
      routes: {
        /**78.4 we can not use '/' as route name, this is actually a special 
         * name, that serves as your home route. if I comment home out here, 
         * it does work though. 78.4*/
        '/': (BuildContext context) => ProductsPage(),
        // 78.2.1
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      /** 79.1 it use for passing data with named routes 
       * onGenerateRoute is executed when we navigate to a named route which is not 
       * registered in our route registry.
      */
      onGenerateRoute: (RouteSettings settings) {
        // 79.3
        final List<String> pathElements =
            settings.name.split('/'); // '/product/1'
        //79.4    
        if (pathElements[0] != '') {
          return null;
        }
        //79.5
        if (pathElements[1] == 'product') {
          //79.6
          final int index = int.parse(pathElements[2]);
          // 79.2 cut/past
          return MaterialPageRoute(
            // 70.9
            builder: (BuildContext context) => ProductPage(
                products[index]['title'], products[index]['image']), //70.9
          ); // 79.2
        }
        // 79.7
        return null;
      },
    );
  }
} 80.1 */

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