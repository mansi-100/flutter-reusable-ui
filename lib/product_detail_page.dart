import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key,required this.items,required this.index});

  List<Map<String,String>> items;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Details"),

       ),
      body:    Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Hero(
            tag: index, //here in hero animation we need unique tag which must be same jya listing to actual display ui che enu joie tya
            child: Container(
              // color: Colors.red,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(items[index]["image"]!),fit: BoxFit.cover)
              ),
            ),
          )),
          Expanded(child: Container(
            color: Colors.blue,
          ))
        ],
      )
      ,
    );
  }
}
