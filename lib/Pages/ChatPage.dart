import 'package:chat_app/Wedgits/ChatBuble.dart';
import 'package:chat_app/Wedgits/constant.dart';
import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
TextEditingController controller=TextEditingController();
final ScrollController _controller = ScrollController();

  ChatPage({super.key});
void _scrollDown() {
  _controller.animateTo(
    0,
    duration: const Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  );
}

 static String id='ChatPage';
 FirebaseFirestore firestore = FirebaseFirestore.instance;
 CollectionReference Message = FirebaseFirestore.instance.collection(KmesssageCollection);
  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder <QuerySnapshot>(
      stream: Message.orderBy(KCreatedAt,descending:true ).snapshots(),
        builder: (context, snapshot ){

     if(snapshot.hasData){
       List <Resala> messsages=[];
       for(int i=0; i<snapshot.data!.docs.length;i++)
       {
         messsages.add(Resala.fromJson(snapshot.data!.docs[i]) );
       }


       return Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor: kPrimaryColor,
           title: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               Image.asset(KLogo,
                 height: 50,),
               const Text( "Scholar Chat"),
             ],
           ),

         ),
         body:Column(
           children: [
             Expanded(
               child: ListView.builder(
                 reverse: true,
                 controller: _controller,
                 itemCount: messsages.length,
                   itemBuilder: (context,index)
               {
                  return messsages[index].id==email ?
                ChatBubble(message: messsages[index],)
                     :ChatBubbleForAFriend(message: messsages[index]);
               }),
             ),
             Padding(
               padding: const EdgeInsets.all(16),
               child: TextField(

                 controller: controller,
                 onSubmitted: (data){

                   Message.add({

                     KMessage:data,
                      KCreatedAt:DateTime.now(),
                     "id":email,




                   });
                   controller.clear();
                   _scrollDown();
                 },
                 decoration: InputDecoration(
                   suffixIcon: const Icon(
                       color:kPrimaryColor,
                       Icons.send
                   ),
                   hintText: "Send Message",
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(16),
                   ),
                 ),

               ),
             ),
           ],
         ),
       );
     }else{
       return const Text("louding...");
     }

        }

    );
  }
}

















