import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/helper/ensure-visible.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class ProductEditPage extends StatefulWidget {
  /*150.6 
  final Function addProduct;
  final Function updateProduct;
  //145.11 final Map<String, dynamic> product;
  final Product product;
  final int productIndex;
  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex}); 150.6*/

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  }; //129.4
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  Widget _buildTitleTextField(Product product) {
    //150.13 (),{
    //150.10 (){
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Product Title'),
        onSaved: (String value) {
          _formData['title'] = value;
        },
        validator: (String value) {
          // if(value.trim().length == 0) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        },
        initialValue:
            // 150.14 widget.product == null ? '' : widget.product.title, //['title'],
            product == null ? '' : product.title,
      ),
    );
  }

  Widget _buildDescTextField(Product product) {
    //150.13 (),{
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        maxLines: 5,
        onSaved: (String value) {
          _formData['description'] = value;
        },
        decoration: InputDecoration(labelText: 'Product Description'),
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description is required and should be 10+ characters long.';
          }
        },
        // 150.14 initialValue: widget.product == null ? '' : widget.product.description, //['description'],
        initialValue: product == null ? '' : product.description,
      ),
    );
  }

  Widget _buildPriceTextField(Product product) {
    //150.13 (),{
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          //129.3 setState(() {
          //129.7 _priceValue =  double.parse(value);
          _formData['price'] = double.parse(value); //129.7
          //});
        },
        decoration: InputDecoration(labelText: 'Product Price'),
        //150.14 initialValue: widget.product == null ? '' : widget.product.price.toString(), //['price'].toString(),
        initialValue: product == null ? '' : product.price.toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should be a number.';
          }
        },
      ),
    );
  }

  //147.9 void _submitForm() {
  // 150.15 void _submitForm(Function addProduct, Function updateProduct) {
  void _submitForm(Function addProduct, Function updateProduct,
  // 164.6
  Function setSelectedProduct, //164.6
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    //150.16 if (widget.product == null) {
    if (selectedProductIndex == null) {
      //145.12 widget.addProduct(_formData);
      //147.10 widget.addProduct(
      addProduct(
          //147.10
          /* 162.17 Product(
              title: _formData['title'],
              description: _formData['description'],
              price: _formData['price'],
              image: _formData['image']) */
          _formData['title'],
          _formData['description'],
          _formData['image'],
          _formData['price'] //162.17

          ); //145.12

    } else {
      //145.13 widget.updateProduct(widget.productIndex, _formData);
      //147.11 widget.updateProduct(
      updateProduct(
          //147.11
          // 150.17 widget.productIndex,
          // 151.1 selectedProductIndex,
          //162 17. Product(
          _formData['title'],
          _formData['description'],
          _formData['image'],
          _formData['price']
          //)
          ); //145.13
    }
    Navigator.pushReplacementNamed(context, '/products')
    // 164.5 pass  selected Product Index = null after done updating
    .then((_) => setSelectedProduct(null))
    ;
  }

  @override
  Widget build(BuildContext context) {
    // 150.11 final Widget pageContent = _buildPageContent(context);

    return
        // 150.7
        ScopedModelDescendant<MainModel>(
      //160.10 <ProductsModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        //160.10 ProductsModel model) {
        // 150.11
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);

        return // 150.7

            // 150.9 widget.product == null
            model.selectedProductIndex == null //150.9
                ? pageContent
                : Scaffold(
                    appBar: AppBar(
                      title: Text('Edit Prod'),
                    ),
                    body: pageContent,
                  );
      },
    );
  }

  GestureDetector _buildPageContent(BuildContext context, Product product) {
    //150.12 (BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

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
              _buildTitleTextField(product), //150.13 (),
              _buildDescTextField(product), //150.13 (),
              _buildPriceTextField(product), //150.13 (),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    /*147.8 wrap our RaisedButton by ScopedModelDescendant
    return RaisedButton(
          child: Text('Save'),
          textColor: Colors.white,
          onPressed: _submitForm,
        ); */
    return ScopedModelDescendant<MainModel>(
      // 160.10 <ProductsModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        //160.10 tsMoProducdel model) {
        return RaisedButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: () => _submitForm(
                model.addProduct,
                model.updateProduct,
                //164.7
                model.selectProduct,
                // 150.15
                model.selectedProductIndex));
      },
    ); //147.8
  }
}
