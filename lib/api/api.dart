import 'dart:convert';

import 'package:capital_hub/core/error/failure.dart';
import 'package:dio/dio.dart';

import '../modal/item.dart';

class Api{

  final _dio= Dio();
  static const baseUrl='https://raw.githubusercontent.com/Bhaveshupadhyay/gym/refs/heads/main/items';

  Future<List<Item>> getItems() async {
    try{
      final response= await _dio.get(baseUrl);
      List list= jsonDecode(response.data);
      return list.map((json)=>Item.fromJson(json)).toList();
    }
    on DioException catch(e){
      throw Failure(e.message);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}
