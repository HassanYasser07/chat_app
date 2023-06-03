import 'package:flutter/material.dart';
class buttom extends StatelessWidget {
   buttom( { required this.onTap, required this.text}) ;
   VoidCallback onTap;
String? text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child:
      Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,

        ),
        child: Center(
          child: Text(text!),
        ),
      ),
    );
  }
}
