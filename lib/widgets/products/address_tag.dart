// 113.6
import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  //113.8
  final String address;
  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    //113.7 cut/past
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        address,
        style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),
      ),
    );
  }
}
