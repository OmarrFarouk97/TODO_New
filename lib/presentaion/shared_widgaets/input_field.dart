
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? title ;
  final String hint ;
  final TextEditingController? controller;
  final TextInputType type;
  final Widget? suffix;
   bool isPassword =false;
  final Function()? onTab;
  final Function()? onPressed;
   double? width = double.infinity;
   String? Function(String?) validator;

  InputField({Key? key,
     this.title,
    required this.hint,
    required this.controller,
    required this.type,
     this.suffix,
    this.onTab,
     this.width,
     this.onPressed,
     required this.validator,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width:width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextFormField(
        cursorColor: Colors.red,
        validator:validator ,
        controller:controller,
        keyboardType: type,
        obscureText: isPassword,
        onTap:onTab,
        decoration: InputDecoration(


          contentPadding: EdgeInsets.only(left: 15.0),
          hintText: hint ,
          suffixIcon: suffix != null? IconButton(
            onPressed: onPressed, icon: suffix!,
          ) : null,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    //   Container(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         title,
    //         style: TextStyle(fontSize: 16),
    //       ),
    //       Container(
    //         height: 52,
    //         margin: EdgeInsets.only(top: 8),
    //         padding: EdgeInsets.only(left: 14),
    //         width:double.infinity ,
    //         decoration: BoxDecoration(
    //           border:  Border.all(
    //             color: Colors.grey,
    //             width: 1
    //           ),
    //           borderRadius: BorderRadius.circular(12)
    //         ),
    //         child: Row(
    //           children: [
    //             Expanded(
    //                 child: TextFormField(
    //                   autofocus: false,
    //                   controller: controller,
    //                   decoration: InputDecoration(
    //                     hintText: hint,
    //                     border: OutlineInputBorder(
    //
    //
    //                       )
    //                     )
    //                     )
    //                   ),
    //
    //
    //           ],
    //         ),
    //       )
    //
    //     ],
    //   ),
    //
    // );
  }
}
