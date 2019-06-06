import 'package:flutter/material.dart';

// 88.2.1
class ProductCreatePage extends StatefulWidget {
  // 92.12
  final Function addProduct;
  ProductCreatePage(this.addProduct); // 92.12

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

//88.2.2
class _ProductCreatePageState extends State<ProductCreatePage> {
  //94 _ at front of variable like private in swift
  // 88.3
  String _titleValue = '';
  // 89.3
  String _descriptionValue = '';
  double _priceValue; //89.3

  @override
  Widget build(BuildContext context) {
    return Container(
        //90.2.1
        margin: EdgeInsets.all(10),
        child:
            //88.1.1 add edit text
            /*91.1 if we use Column wedget we will have problem with keyboard let's
       use ListView wedget 
       Column ( */
            ListView(children: <Widget>[
          TextField(
            // 88.1.2
            //autofocus: true,
            // 88.1.3 when ever text change
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
            // 88.1.4 when done with input text
            // onSubmitted: ,
            //90.1.1
            decoration: InputDecoration(labelText: 'Product Title'),
          ),
          // 89.1 Text(titleValue)
          TextField(
            //89.5
            maxLines: 12,

            onChanged: (String value) {
              setState(() {
                //89.3.1
                _descriptionValue = value;
              });
            },
            //90.1.2
            decoration: InputDecoration(labelText: 'Product Description'),
          ),
          // 89.2
          TextField(
            //89.4
            keyboardType: TextInputType.number,

            onChanged: (String value) {
              setState(() {
                //89.3.2
                _priceValue = double.parse(value);
              });
            },
            //90.1.3
            decoration: InputDecoration(labelText: 'Product Price'),
          ),
          
          //93.1
          SizedBox(
            height: 10.0,
          ),
          // 91.2 add a btn to save a product
          RaisedButton(
            child: Text('Save'),
            // 93.2
            color: Theme.of(context).accentColor,
            textColor: Colors.white,

            onPressed: () {
              // 92.14 create a product
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/food.jpg'
              };
              // 92.13 why use widget property here?
              widget.addProduct(product);
              // 93.3
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ]));
  }
}

/*88.2 so because we have an internal change here and if we want to change data
 internally, we need to use a stateful widget 
class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 84.1
    return Center(
      child: RaisedButton(
        child: Text('Save'),
        onPressed: () {
          // 84.2 modal
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('This is a Modal!'),
                );
              });
        },
      ),
    );
  }
}
88.2*/
