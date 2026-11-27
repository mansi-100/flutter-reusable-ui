import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDesigns {
  //this is a fun
  static InputDecoration inputDecoration({
    // bool? isEdit,
    required String text,
    required String label,
    bool isPassVisible = false,
    VoidCallback? setState // not work might be iuts just for use case
}){
      return InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green.shade900)
          ),
          hintText: text,
          // alignLabelWithHint: true,
          label: Text(label),
          suffixIcon: IconButton(icon : isPassVisible ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.remove_red_eye),
          onPressed: (){
            setState!;
          },),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          // suffixIcon :  IconButton(
          //   icon : Icon( obSecureText ?  Icons.remove_red_eye : Icons.remove_red_eye_outlined),
          //   onPressed:() {
          //     ss((){
          //       obSecureText = !obSecureText;
          //
          //     });
          //
          //   },),
      );

  }

  //this is a var need to convert in fun to take val of elevated buttons style dynamically see below elevatedBtStyle

  static ButtonStyle elevatedButtonStyle =  ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.green),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
        shadowColor: MaterialStatePropertyAll(Colors.blue),
        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
        maximumSize: WidgetStatePropertyAll(Size(800,50)),


    );


  static ButtonStyle elevatedBtStyle ({
    Color? bgcolor,
    Color? fgcolor,double? radius,
    double? mwidth,
    double? mHeight
  })
  {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(bgcolor ?? Colors.green),
      foregroundColor: WidgetStatePropertyAll(fgcolor ?? Colors.white),
      shape:   WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(radius ?? 10))),
      minimumSize: WidgetStatePropertyAll(Size(mwidth ?? 200,mHeight ?? 50)),

    );
  }


  static TextStyle textTitle = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );


  static TextStyle textSmall = GoogleFonts.abhayaLibre(
    fontSize: 18,
    color: Colors.black.withValues(alpha: 0.5 ),
  );

  }

