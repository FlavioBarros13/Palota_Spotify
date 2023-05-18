


import 'dart:convert';
import 'package:flutter_spotify_africa_assessment/features/api/constants/ApiConstants.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  static String apiKey='_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==';
  //https://palota-jobs-africa-spotify-fa.azurewebsites.net/_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==browse/categories/{afro}
  static const  String  fcmBaseURL ='https://fcm.googleapis.com/fcm/send';



  static Future<dynamic>getResponse(String url)async{

    Map <String,String> header={
      ApiConstants.contentType:ApiConstants.applicationJson,
      ApiConstants.xFunctionKey: apiKey,
    };
    http.Response response =await http.get(Uri.parse(url),headers: header);
    try{

      if(response.statusCode==200)
      {

        String jSonData=response.body;
        var decoding = jsonDecode(jSonData);

        return decoding;
      }
      else
      {

        return 'Failed';
      }
    }catch(e,str)
    {
      return  'Failed';

    }
  }
}