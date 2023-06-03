 import 'package:chat_app/Wedgits/bottom.dart';
import 'package:chat_app/helper/show_Snake_Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Wedgits/Text_Field.dart';
import '../Wedgits/constant.dart';
import 'ChatPage.dart';
import 'Register_Sarean.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
 static String id="login_screan";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   String? email;
   String? password;
   bool inAsyncCall=false;

   GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8),
         child: Form(
           key: formKey,
           child: ListView(children: [
             const SizedBox(height: 180,),
             const Image(height: 100,
               image:
             AssetImage("assets/images/scholar.png"),
             ),
             const SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 Text(
                   style:TextStyle(
                     color: Colors.white,
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'Pacifico'
                   ),
                   "Scholar Chat",
                 ),
               ],
             ),
             const SizedBox(height: 15,),
             Row(
               children: const [
                 Text(
                     style:TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                     ),
                     "Sign In"),
               ],
             ),
             const SizedBox(height: 15,),
             Text_field(hintText: "Email",
             onChanged: (data){
               email=data;
             },
             ),
             const SizedBox(height: 7,),
             Text_field(
               obscureText: true,
               hintText: "Password",
             onChanged: (data){
               password=data;
             },),
             const SizedBox(height: 15,),
             buttom(
               text: "Sign In",
              onTap: ()
           async {
             if (formKey.currentState!.validate()) {
               inAsyncCall=true;
               setState(() {

               });

               try {
                 await loginUser();
                 Navigator.pushNamed(context, ChatPage.id,arguments: email);
               } on FirebaseAuthException catch (e) {
                 if (e.code == 'user-not-found') {
                   showSnakeBar(context, 'No user found for that email.');
                 } else if (e.code == 'wrong-password') {
                   showSnakeBar(context, 'Wrong password provided for that user.');
                 }
               }
               inAsyncCall=false;
               setState(() {

               });
             }else {

             }
           },
             ),
             const SizedBox(height: 7,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               const Text("don't have an account ?"
               ,style: TextStyle(
                   color: Colors.white
                 ),),
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, RegisterPage.id);
                 },
                 child: const Text(
                   " Register",
                   style: TextStyle(
                     color: Color(0xffC7EDE6),
                   ),
                 ),
               ),
             ],),
             const SizedBox(height: 15,),
           ],),
         ),
       ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
    );
  }
}
