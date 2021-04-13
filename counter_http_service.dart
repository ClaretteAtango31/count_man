

import 'dart:convert';

import 'package:count_man_app/models/counter.dart';
import 'package:count_man_app/models/user.dart';
import 'package:count_man_app/utils/constants.dart';
import 'package:dio/dio.dart';

class CounterHttpService{
  
  Future<CounterList> getAll({int page=1}) async {

    Map<String, dynamic> query = {"page":page};
    Dio dio = new Dio();
    Response reponse = await dio.get(endpoint()+"api/counters",queryParameters: query);
    print(reponse.toString());
    return CounterList.fromJson(json.decode(reponse.toString()));
  }
}