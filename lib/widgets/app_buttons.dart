import 'package:flutter/material.dart';
import 'package:flutter_reusable_ui/app_designs.dart';

class AppButton extends StatelessWidget{
  String label;
  VoidCallback onTap;
  IconData? icon;
  Color? bgColor;
  Color? fgColor;
  double? radius;
  double? minWidth;
  double? minHeight;

  AppButton({required this.label,required this.onTap,this.icon,this.bgColor,this.fgColor,this.radius,
    this.minWidth,
    this.minHeight // u can give default val here too this.minHeight=199
  });
  @override
  Widget build(BuildContext context) {
      return ElevatedButton(onPressed: onTap,
          // style: AppDesigns.elevatedButtonStyle, //to give dynamic design uncommnet below line
         style : AppDesigns.elevatedBtStyle(bgcolor: bgColor,fgcolor: fgColor,radius: radius,mHeight: minHeight,mwidth:minWidth ),
          child: icon != null ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Icon(icon),
                      SizedBox(width: 5,),
                    Text(label),
                ],
              )
              :Text(label),

      );
  }

}