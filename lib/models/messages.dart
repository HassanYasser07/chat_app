import 'package:chat_app/Wedgits/constant.dart';

class Resala{
  final String message;
  final String id;

  Resala(this.message, this.id);
  factory Resala.fromJson(jsonData){
  return Resala(jsonData[KMessage],jsonData["id"]);
  }
}