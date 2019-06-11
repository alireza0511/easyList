import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/helper/ensure-visible.dart';

// 131.1 change all ProductCreatePage to ProductEditPage
class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  //131.3 ProductEditPage(this.addProduct);
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;
  ProductEditPage(
      {this.addProduct,
      this.updateProduct,
      this.product,
      this.productIndex}); //131.3

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  /*129.4 instead of this all value we can have a MAP
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue; */
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  }; //129.4
  //124.5
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //124.5
  // 134.1
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode(); //134.1

  Widget _buildTitleTextField() {
    /* 124.2 instead of TextField widget we need to use TextFormWidget to use Form 
    return TextField(
      //autofocus: true,
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
      decoration: InputDecoration(labelText: 'Product Title'),
    ); */

    return
        // 134.2.1
        EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode, //134.2.1
      child: TextFormField(
        //134.2.2
        focusNode: _titleFocusNode, //134.2.2

        decoration: InputDecoration(labelText: 'Product Title'),

        // 124.3 instead of onChanged method we can use onSaved method
        onSaved: (String value) {
          /*129.1 I'm always calling setState here but this is not required anymore 
        here, we don't need to set the state here because I don't want to re-render 
        the page or anything like that whenever we type there, so no need to set the state.
        Instead we can just save our values in normal properties of this class without setting state 
        setState(() { 129.1*/
          //129.5 _titleValue = value;
          _formData['title'] = value; //129.5
          // });
        },
        //125.2
        //125.3 autovalidate: true,
        /* 125.1 best addvantage of useing form is having better way to access
      vallidation input */
        validator: (String value) {
          // if(value.trim().length == 0) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        }, // 125.1
        //132.4
        initialValue: widget.product == null ? '' : widget.product['title'],
      ),
    ); //124.2
  }

  Widget _buildDescTextField() {
    //124.7.1 return TextField(
    return
        //134.3.1
        EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: // 134.3.1
          TextFormField(
        //134.3.2
        focusNode: _descriptionFocusNode, //134.3.2
        maxLines: 5,
        //124.7.2 onChanged: (String value) {
        onSaved: (String value) {
          //129.2 setState(() {
          //129.6 _descriptionValue = value;
          _formData['description'] = value; //129.6

          //});
        },
        decoration: InputDecoration(labelText: 'Product Description'),
        // 126.1
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description is required and should be 10+ characters long.';
          }
        },
        //132.3
        initialValue:
            widget.product == null ? '' : widget.product['description'],
      ),
    );
  }

  Widget _buildPriceTextField() {
    //124.8.1 return TextField(
    return
        //134.4.1
        EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: //134.4.1
          TextFormField(
        //134.4.2
        focusNode: _priceFocusNode, //134.4.2
        keyboardType: TextInputType.number,
        //124.8.2 onChanged: (String value) {
        onSaved: (String value) {
          //129.3 setState(() {
          //129.7 _priceValue =  double.parse(value);
          _formData['price'] = double.parse(value); //129.7
          //});
        },
        decoration: InputDecoration(labelText: 'Product Price'),
        // 132.1 initial the value of the edit page
        initialValue: widget.product == null
            ? ''
            : widget.product['price'].toString(), //132.1
        // 126.2
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should be a number.';
          }
        },
      ),
    );
  } // 114.1

  // 114.2
  void _submitForm() {
    //125.3
    if (!_formKey.currentState.validate()) {
      return;
    }
    //124.6
    _formKey.currentState.save(); //124.6
    /* 129.8 
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product); */
    //133.7 widget.addProduct(_formData); //129.8
    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    } // 133.7
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    
    //132.2.1 cut/copy GestureDetector Widget
    final Widget pageContent = _buildPageContent(context);
    //132.2.2 we can check this is on edit mode or add mode
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Prod'),
            ),
            body: pageContent,
          ); //132.2.2
    /*132.2.1 cut/copy GestureDetector Widget

    return
        // 128.1 hide keyboard
        GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: // 128.1
          Container(
        margin: EdgeInsets.all(10),
        child:
            // 124.1 form help us to check the input of
            Form(
          /*124.4 the key is a global key we created and that will simply allows 
        us to access form object from other parts of our app. 124.4*/
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              /* 120.1 create new type of btn the GestureDetector widget make all 
          * object clickable  
          ,GestureDetector(
            onTap: _submitForm,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(5.0),
              child: Text('My Button'),
            ),
          ) 120.1 */
            ],
          ),
        ),
      ),
    ); 132.2.1*/
  }

  GestureDetector _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth; // 118.1
    
    return GestureDetector(
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    ),
  );
  }
}

/** 132.2
 * It's coming from the fact that when we push this page by clicking edit btn,
 * we're missing the scaffold. Previously, we loaded that for taps in products_admin 
 * page, we only switch between taps and the taps are only embedded in the body 
 * of this page where we have a scaffold with an app bar.
 */
