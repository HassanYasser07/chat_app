
import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key,required this.message}) : super(key: key);

final Resala message ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        padding: const EdgeInsets.only(left: 16,bottom: 16 ,top: 16,right: 32),

        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            color: kPrimaryColor

        ),
        child: Text(message.message,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
class ChatBubbleForAFriend extends StatelessWidget {
  const ChatBubbleForAFriend({Key? key,required this.message}) : super(key: key);

  final Resala message ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        padding: const EdgeInsets.only(left: 16,bottom: 16 ,top: 16,right: 32),

        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22),
            ),
            color: Color(0xff006984),

        ),
        child: Text(message.message,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
