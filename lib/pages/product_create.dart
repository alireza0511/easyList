import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

// 114.1 refactoring method
  Widget _buildTitleTextField() {
    return TextField(
      //autofocus: true,
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
      decoration: InputDecoration(labelText: 'Product Title'),
    );
  }

  Widget _buildDescTextField() {
    return TextField(
      maxLines: 5,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
      decoration: InputDecoration(labelText: 'Product Description'),
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
      decoration: InputDecoration(labelText: 'Product Price'),
    );
  } // 114.1

  // 114.2
  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          /*114.1 
          TextField(
            //autofocus: true,
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
            decoration: InputDecoration(labelText: 'Product Title'),
          ),*/
          _buildTitleTextField(),
          _buildDescTextField(),
          _buildPriceTextField(), //114.1,
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed:
                /*114.2 () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/food.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            }*/
                _submitForm, // 114.2
          )
        ],
      ),
    );
  }
}
