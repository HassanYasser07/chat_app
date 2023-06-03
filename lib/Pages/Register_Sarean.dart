import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Wedgits/Text_Field.dart';
import '../Wedgits/bottom.dart';
import '../Wedgits/constant.dart';
import 'ChatPage.dart';
import '../helper/show_Snake_Bar.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({Key? key}) : super(key: key);
  static String id="Register";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      "Register"),

                ],
              ),
              const SizedBox(height: 15,),
              Text_field(
                hintText: "Email",
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
                onTap: ()
                async {
                  if (formKey.currentState!.validate()) {
                    inAsyncCall=true;
                    setState(() {

                    });
                    try{
                        await registerUser();
                       Navigator.pushNamed(context, ChatPage.id,arguments: email);

                      }
                    on FirebaseAuthException catch(e){
                      if(e.code == 'weak-password'){ showSnakeBar(context,"week password");}
                      else if(e.code == 'email-already-in-use'){showSnakeBar(context,"email already exists");}
                    }
                    catch(e){
                      showSnakeBar(context, "there was an error");
                    }
                    inAsyncCall=false;
                    setState(() {

                    });
                  }else{}

                },
                text: "Register",
              ),
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("already have an account ?"
                    ,style: TextStyle(
                        color: Colors.white
                    ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text(
                      " login",
                      style: TextStyle(
                          color: Color(0xffC7EDE6)
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



  Future<void> registerUser() async {
      UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
