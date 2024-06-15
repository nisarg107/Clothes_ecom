import 'dart:convert';

import 'package:mysqlpractise/users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs{
  static Future<void> storeUserInfo(User userinfo) async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userinfo.toJson());
    await sharedPreferences.setString("currentUser", userJsonData);
  }

  //get-read userinfo
  static Future<User?> readUserInfo() async{
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    if(userInfo!=null){
      Map<String,dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo= User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
  static Future<void> removeUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}