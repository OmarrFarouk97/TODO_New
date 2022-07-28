import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Color textColor;
  final double height;
  final double width;
  final VoidCallback onClick;
  final double radius;
  final Color background;
  final Color colorMaterialButton;

  const MyButton({
    Key? key,
    this.text,
    this.textColor = Colors.white,
    this.height = 52.0,
    this.width = double.infinity,
    required this.onClick,
    this.radius = 15.0,
    this.background=Colors.teal,
    this.colorMaterialButton =Colors.teal

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            radius
        ),
      ),
      child: MaterialButton(
        color: colorMaterialButton,
        height: height,
        onPressed: () {
          onClick();
        },
        child: Text(
          text!,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}



