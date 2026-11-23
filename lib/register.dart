import 'package:flutter/material.dart';
import 'package:flutter_reusable_ui/app_designs.dart';
import 'package:flutter_reusable_ui/widgets/app_buttons.dart';

class Register extends StatelessWidget {
  Register({super.key});

  bool? isPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome please register yourself",style: AppDesigns.textTitle,),
              TextField(
                decoration: AppDesigns.inputDecoration(text: "Enter a name", label: "Name"),
              ),
              SizedBox(height: 10,),
              StatefulBuilder(
                builder: (context,ss) {
                  return TextField(
                    obscureText: isPassVisible!,
                    decoration: AppDesigns.inputDecoration(text: "Enter a Password", label: "Password",isPassVisible: isPassVisible!,
                        // setState: ss
                    ),

                  );
                }
              ),
              SizedBox(height: 10,),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: () {
                        print("Thanks");
                      }, child: Text("Submit"),style: AppDesigns.elevatedButtonStyle,
                                   ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: AppButton(bgColor: Colors.red,fgColor : Colors.black,label: 'Login', onTap: () {
                        print("Welcome folks");
                      },),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: AppButton(label: 'Login2',icon: Icons.add,radius: 80,minWidth: 50,minHeight: 200,onTap: () {
                        print("Welcome folks");
                      }),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
}
