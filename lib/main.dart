import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/products.dart';
import './scoped-models/main.dart';

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
  /* 146.4 cut/past to soped-models/products..dart
  // 145.2 List<Map<String, dynamic>> _products = [];
  List<Product> _products = [];

  //145.3 void _addProduct(Map<String, dynamic> product) {
  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  //145.4  void _updateProduct(int index, Map<String, dynamic> product) {
  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  } 146.4*/

  @override
  Widget build(BuildContext context) {
    return
        // 148.1 we need to instantiate our model here
        ScopedModel<MainModel>( //160.4 <ProductsModel>(
      model: MainModel(), // 160.4 ProductsModel(),
      child: //148.1
          MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
          // 102.4
          // fontFamily: 'Oswald' //102.4
          buttonColor: Colors.blueAccent,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) =>
              ProductsPage(/*148.1 _products */),
          '/admin': (BuildContext context) => ProductsAdminPage(
              /*148.1 
            _addProduct, _updateProduct, _deleteProduct, _products */
              )
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
                //149.1
                index
                   /*148.1 
                  //145.5
                  _products[index].title, //['title'],
                  _products[index].image, //['image'],
                  _products[index].description, //['description'],
                  _products[index].price, //['price']),//145.5 */
                  ),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  ProductsPage(/*148.1 _products */));
        },
      ),
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
// 138 make product list pretier
// 139 drag and delete in product list
// 145 create models
// 146 Add scoped_model 1.0.1 to our project let's go to .yami page
// 147 start to using scoped model
/**148 we instantiate our model scoped for that entire widget tree and that 
 * will be my products. And this is where we instantiate our model,we create 
 * one instance only when our app starts and we pass down that instance to the
 *  material app and all its child widgets. this gets passed down without us 
 * using the constructors so it gets passed down to all child widgets */
// 149 we want use our Model scoped to fetch data in product page
// 153 Creating the Toggle favorite method
// 155 how add notifyListener to notify our scoped model
// 158 add user model
/** 160 
 * A mixin simply is a class we merged with another class, we can merge classes
 * , and also we can import functionalities from class B into Class A and that 
 * allows us to create a totally new scoped model, I'll name it main.dart 
 * because that will be my main model essentially.160*/  

 // 162 make a relationship between two model 