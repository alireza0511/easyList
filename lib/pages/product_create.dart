// 76.4
import 'package:flutter/material.dart';

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
