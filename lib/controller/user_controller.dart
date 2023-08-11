import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserController extends GetxController{
  // get product
  Future<User> getData() async {
    var response = await http.get(Uri.parse("https://randomuser.me/api/?results=10"));
    if(response.statusCode==200){
      return User.fromJson(jsonDecode(response.body));
    }else{
      return throw Exception("Something wrong, please try again");
    }
  }
}