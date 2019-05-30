import 'package:flutter/material.dart';
// 31.13 because we want use product manager as body in our app let import it
import './product_manager.dart';

void main() => runApp(MyApp());


/* 27.1 this work an show a pic + title + btn but btn doesn't work because
for changing data we need StateFulWidget 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: Column(
          children: [
            Container(margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {

              },
              child: Text('Add Product'),
            ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/food.jpg'),
                  Text('Food Paradise')
                ],
              ),
            ),
          ],
        )),
    );
  }
} 27.1*/

/* 31.10 Now we're not handling any state in the main.dart file anymore so we 
can turn this stateful widget back to a stateless widgetate 
// 27.2 create a statefulWdget to work with btn
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //27.4 return _MyAppState and instantiate it by adding ()
    return _MyAppState();
  }
} 31.10*/

/* 31.12 remove the _MyAppState class 
/* 27.3.1 
because the way you work with state in flutter is that you actually create two 
classes which will work together and this is kind of the connection createState 
will return a new state object with a state that is configured to work with a 
stateful widget.  let's create 2nd class 
27.3.2 : the underscore is just a convention for classes that should not be usable 
by other parts or other files but only from inside this file and flutter will 
actually respect this.
27.3.3 : Now we just need to tell flutter that this _MyAppState class belongs to MyApp 
widget and we do this by adding these angle brackets <MyApp> after state, we 
add the name of the class to which this state belongs and now the connection 
between the two classes is set up.*/
class _MyAppState extends State<MyApp> {
/* 28.1 : We created a stateful widget but the question is 
how can we now manage and change data inside of it? 
let add a array to hold or new product so because this array just use at this class
let add _ at first of name
31.5 : cut/past _product list from main.dart file */
  List<String> _products = ['Food Tester']; // 31.5

  @override
  Widget build(BuildContext context) {
    // 27.3.4 copy all ui widget at 27.1 here
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('EasyList'),
          ),
          body: Column(
            children: [
              /* 31.4 cut/past column widget to products.dart file */
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    /* 29.1.1  now by clicking btn we can change or product -> build executed again
                    -> update _product list map to card -> render this card to screen 
                    29.1.2 so add a value to _product list
                    _products.add('Advanced Food Tester');
                    print(_products); 29.1.2 */
                    /* 29.2 you have to tell flutter that you're changing the data 
                    in your stateful widget or put in other words that you're 
                    changing its state. And you do this by calling the setState method.*/
                    setState(() {
                      _products.add('Advanced Food Tester');
                    });

                  },
                  child: Text('Add Product'),
                ),
              ), // 31.4
              /* 28.3.1 now we can't convert a list into a single widget so what I 
            will instead do is I will add another column 
             30.4 cut/past column widget to products.dart file */
              Column(
                children:
                    /* 28.2.1 now we can use _product here to change data of widget.
             map method allows you to transform every element in that list
             into a new element and return it 
             28.2.3: One important note though, you need to wrap element 
             between parentheses, this is the argument list for the function,*/
                    _products
                        .map(
                          (element) => Card(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/food.jpg'),
                                    // 28.2.2 use element insted of hard code text
                                    Text(element)
                                  ],
                                ),
                              ),
                        )
                        // 28.3.2 we need to convert or product map to a array list
                        .toList(),
              ) //30.4
            ],
          )),
    );
  }
} 31.12*/

/* 30.1 : at this step we want split the app into granular pices
   30.2 : let create a new file in "lib" folder with name 'products'*/
/* 31.1 : let create another file in "lib" folder with name 'product_manager'*/
/* 32.1  what if our stateful widget also wants to receive some data from 
  outside*/
// 31.11 make MyApp StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        /* 32.5 now we can pass our value to statful widget here 
        //31.14 let's call ProductManager as body of scaffold widget, create an object based on it by adding parentheses.
        body: ProductManager(), 32.5*/
        body: ProductManager('Food Tester'),
      ),
    );
  }
}

/* 31.15 you want to work with stateless and stateful widgets, use as many stateless widgets
as possible and have a few selected stateful widgets which actually manage your 
data and change the data */