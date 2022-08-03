import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final String? label;
  final String validation;
  final TextInputType type;
  final double radius;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLength;
  final String? hintText;
  const MyForm({


    Key? key,
     this.label,
    required this.validation,
    required this.type,
    required this.controller,
    this.radius = 15,
    this.isPassword= false,
    this.prefix,
    this.suffix,
    this.maxLength=10,
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText:  isPassword,
      keyboardType: type,
      controller: TextEditingController(),
      validator: (value){
        if (value!.isEmpty)
          {
            return validation;
          }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        labelText: label,
        hintText: hintText,


      ),
    );
  }
}
