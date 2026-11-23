import 'package:flutter/material.dart';
import 'package:flutter_reusable_ui/app_designs.dart';
import 'package:flutter_reusable_ui/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatelessWidget {
   Loginscreen({super.key});

   TextEditingController emailController = TextEditingController();
   TextEditingController password = TextEditingController();
   bool obSecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Container(
          width: 500,
          // height: 500,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text("Welcome",style: GoogleFonts.eduNswActCursive(
                fontSize: 22,
                color: Colors.black
              ),),
              TextField(
                controller: emailController,
                decoration: AppDesigns.inputDecoration(label: "Enter Your Email",text: "Email")
              ),
              SizedBox(height: 20,),
              StatefulBuilder(
                builder: (context,ss) {
                  return TextField(
                    // controller: password,
                    obscureText: obSecureText,
                    decoration: AppDesigns.inputDecoration(label: "Enter Your Password",text: "Password")
//this way we can add logic
                        // suffixIcon: IconButton(
                    //     icon : Icon( obSecureText ?  Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                    //         onPressed:() {
                    //       ss((){
                    //         obSecureText = !obSecureText;
                    //
                    //       });
                    //
                    //         },),
                    //     hintText: "Enter Password",
                    //     label: Text("Please Enter Your Password"),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(color: Colors.black))
                    // ),
                  );
                }
              ),              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed:  () {
                      print("success");
                    }, child: Text("Login"),style : AppDesigns.elevatedButtonStyle),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(onPressed:  () {
                      print("success");
                      Navigator.pushNamed(context,AppRoutes.register);
                    }, child: Text("Register"),style : AppDesigns.elevatedButtonStyle),
                  )
                ],
              )

            ],
          ),
        ),
      ) ,
    );
  }
}
