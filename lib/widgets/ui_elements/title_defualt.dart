// 113.1 refactoring
import 'package:flutter/material.dart';

class TitleDefualt extends StatelessWidget {
  //113.4
  final String title;
  TitleDefualt(this.title);

  @override
  Widget build(BuildContext context) {
    // 113.3 cut/past
    return Text(
      title,
      style: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}
