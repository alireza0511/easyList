import 'package:flutter/material.dart';

// 67.3
class ProductPage extends StatelessWidget {
//70.1 we want to pass data from home page to detailPage we need this variable
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl); // 70.1

  @override
  Widget build(BuildContext context) {
    return
        /* 72.1 We can wrap our page here with another widget which will simply listen to the back button 
    being pressed*/
        WillPopScope(
      onWillPop: () {
        print('back btn tapped');
        // 72.2
        Navigator.pop(context, false);
        /* 72.3 WillPopScope need return a Future that allow to user leave or not leave the page.
      but app will Crash! if the value of Future be 'true' because we're navigating manually here 
      which we need to do because we want to pass our own data back but then here, this essentially
      triggers another popping action and since we already are on the root page, it tries to pop the 
      root page which crashes our app. So you should actually return false for Future.value to not 
      continue with the original pop request which was issued by the click of that back button but 
      to ignore that original request and only execute our custom request here.*/
        return Future.value(false);
      },
      child:
          // 67.4 because this page replace with homepage we need use scaffold wedget
          Scaffold(
        appBar: AppBar(
          // 70.2.1
          // title: Text('Product Detail'), // 70.2.1
          title: Text(title),
        ),
        body:
            /* 68.3
      Center(
        child: Text('On the Product Page'),
      ), 68.3 add a sample back btn*/
            /* 69.4 add Center
          69.6 if we use an image on our design, We can get rid of that center widget 
          because the image is a widget which will take the full available width so it 
          will automatically span over the full width of the page and we don't need
          to center it explicitly.
          Center( */
            Column(
          // 69.1 horizental
          crossAxisAlignment: CrossAxisAlignment.center,
          //69.2 vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 70.2.2
            // 69.5
            // Image.asset('assets/food.jpg'), // 70.2.2
            Image.asset(imageUrl),
            // 69.7 padding
            Container(
              padding: EdgeInsets.all(10),
              child: Text('On the Product Page'),
            ),
            //69.8
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // 71.1 pass data from detail view to root view
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Delete'),
                  onPressed: () => //83.1.1 Navigator.pop(context, true),
                      //83.1.2
                      _showWarningDialog(context)),
            ) //71.1
          ],
        ),
        //69.6 ),
      ),
    );
  }

//83.2 create a alert dialog
  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  //83.2.1 this one close the dialog
                  Navigator.pop(context);
                  // 83.2.2 this one close the detail page and pass data to root view
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }
}
