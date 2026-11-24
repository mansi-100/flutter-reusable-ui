import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  AppTextfield({super.key,required this.hintText,required this.labelText,this.color,this.icon});
  Color? color;
  String hintText;
  String labelText;
  Icon? icon;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5,),
        Expanded(
          flex: 4,
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: icon ??  null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40)
              ),
              hintText: hintText,
              labelText: labelText
            ),
          ),
        ),
        Expanded(child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          child: IconButton(onPressed: () {
          }, icon: Icon(Icons.sort),iconSize: 40,),
        ))
      ],
    );
  }
}
