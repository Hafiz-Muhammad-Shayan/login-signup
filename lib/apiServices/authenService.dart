

import 'package:dio/dio.dart';

class Authenservice {

  static final _dio = Dio(BaseOptions(baseUrl: "http://158.220.92.206:5000")) ;

  static Future<void> loginUser ({
    required String username ,
    required String password ,
    required double latitude ,
    required double logitude ,
    required String fcmToken ,
    required String zone ,

}) async {
    
    try {

      final response = await _dio.post("/api/drivers/login" , data: {
        "username" : username ,
        "password" : password ,
        "latitude" : latitude ,
        "logitude" : logitude ,
        "fcmToken" : fcmToken ,
        "zone" : zone ,

      }) ;
      print("Token & Location sent successfully: ${response.data}");
    }catch (e) {
      print("Error sending data to backend: $e");
    }


  }
}