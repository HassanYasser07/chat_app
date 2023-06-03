
import 'package:flutter/material.dart';

class Text_field extends StatelessWidget {
   Text_field({super.key, this.hintText,this.onChanged ,this.obscureText=false}) ;
String? hintText;
Function(String)? onChanged;
bool? obscureText;
  @override

  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText!,
      validator: (data){
        if(data!.isEmpty){
          return "field is required !";
        }
      },
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ),
      ),

    );
  }
}
