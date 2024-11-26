import 'package:flutter/material.dart';

class DSTextFiledCodeWidget extends StatefulWidget {
  const DSTextFiledCodeWidget({
    super.key,
  });

  @override
  State<DSTextFiledCodeWidget> createState() => _DSTextFiledCodeWidget();

}
class _DSTextFiledCodeWidget extends State<DSTextFiledCodeWidget> {
  // final style = DSTextFieldStyle();

  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 45.0,
      alignment: Alignment.center,
      child: new Text(
        "",
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
          border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Colors.black,
              ))),
    );
  }
}
