

import 'dart:convert';

import 'package:count_man_app/models/user.dart';
import 'package:count_man_app/utils/constants.dart';
import 'package:dio/dio.dart';

class UserHttpService{
  
  Future<users_list> checkLogin(String username,String password,{int page=1,}) async {

      Map<String, dynamic> query = {
        "page": page,
        "username": username,
        "password": password
      };
      Dio dio = new Dio();
      Response reponse = await dio.get(
          endpoint() + "api/people", queryParameters: query);
      print(reponse.toString());
      return users_list.fromJson(json.decode(reponse.toString()));

    return null;
  }
}