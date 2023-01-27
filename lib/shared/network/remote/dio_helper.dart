
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class dioHelper {

  static Dio dio;
  static init (){
    dio=Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/' ,
        receiveDataWhenStatusError: true,

      ),


    );
  }


static Future<Response> getData ({
  @required String url ,
  Map<String,dynamic> query ,
  String lang="en",
  String token ,
})async
{
  dio.options.headers=
  {
    "lang":lang,
    'Content-Type':'application/json',
    "Authorization":token??'',
  };
return await dio.get(
    url,
    queryParameters: query??null,
);
}

static Future<Response> postData({
  @required String url,
  Map<String,dynamic> query=null,
  @required Map<String,dynamic> data,
  String lang="en",
  String token,
})async
{
  dio.options.headers=
  {
    "lang":lang,
    'Content-Type':'application/json',
    "Authorization":token??'',
  };
  return dio.post(
    url,
    data: data,
    queryParameters: query,
  );
}
}