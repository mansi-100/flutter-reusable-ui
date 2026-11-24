import 'dart:async';

import 'package:flutter/material.dart';

class AppCarsouel extends StatefulWidget {
  AppCarsouel({super.key,required this.images});
  List<String> images;

  @override
  State<AppCarsouel> createState() => _AppCarsouelState();
}

class _AppCarsouelState extends State<AppCarsouel> {
  int index=0;
  Timer? timer;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!_pageController.hasClients || widget.images.isEmpty) return;
      index = (index+1) % widget.images.length;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve:Curves.bounceIn);

    },);
  }


  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         SizedBox(
          height: 300,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.images[index]),fit: BoxFit.cover),
                    gradient: LinearGradient(colors: [
                      Color(0xfff8f7f2),
                      Color(0xfffaebe1)
                    ])
                  )
              );
            },),

             ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: List.generate(widget.images.length, (dotIndex) {
             final isActive = dotIndex == index;

             return AnimatedContainer(duration: Duration(milliseconds: 5),
               decoration: BoxDecoration(
                 color:isActive ?  Colors.orange : Colors.orange.shade100
               ),
               height: 10,
               width: isActive ? 50 : 20,
               margin: const EdgeInsets.symmetric(horizontal: 5),
              //need to give margin to  j visible thse gap rakhine nai to ek pchi ek j avse aa

             );
             /*AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: isActive ? 30 : 15,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.deepOrange : Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );*/
           }),
         )
         /*list . gernate is shortcut of
         Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    for (int i = 0; i < widget.images.length; i++)
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: index == i ? 25 : 8,
        decoration: BoxDecoration(
          color: index == i ? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
  ],
)*/

       ],
     );

  }
}
