import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/home_model.dart';

class HomeService {
  // Future<List<Result>?> getHomeData() async {
  //   try {
  //     var token =
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE5NTU4Mjg1LCJpYXQiOjE3MTk0NzE4ODUsImp0aSI6IjgxNTQ0ZjA1YmI0YTQ3ZjQ4OWZlMjdlNTcyNTI1N2FlIiwidXNlcl9pZCI6MTY1fQ.7OaWf37oBDaHfDu-12MSLDtG-qHkx7v6NUmw8ihXGUU';
  //     var headers = {
  //       'Authorization': 'Bearer $token',
  //     };
  //     var url = 'https://frijo.noviindus.in/api/home';
  //     var response = await http.get(Uri.parse(url));
  //     response.headers.addAll(headers);

  //     if (response.statusCode == 202) {
  //       HomeModel homeModel = homeModelFromJson(response.body);
  //       return homeModel.results;
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  Future<List<Result>?> getData() async {
    try {
      var token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE5NTU4Mjg1LCJpYXQiOjE3MTk0NzE4ODUsImp0aSI6IjgxNTQ0ZjA1YmI0YTQ3ZjQ4OWZlMjdlNTcyNTI1N2FlIiwidXNlcl9pZCI6MTY1fQ.7OaWf37oBDaHfDu-12MSLDtG-qHkx7v6NUmw8ihXGUU';
      var headers = {
        'Authorization': 'Bearer $token',
        'Cookie':
            'csrftoken=czxnPmTfmtib1uxDlCWpsJ9pWmlVl2O9; sessionid=tkgqs7h57lvlqy46lv5ne0yniiku82uc'
      };
      var request =
          http.Request('GET', Uri.parse('https://frijo.noviindus.in/api/home'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        HomeModel homeModel = homeModelFromJson(responseBody);
        return homeModel.results;

        // if (homeModel.status == true) {
        //   return homeModel.results;
        // } else {
        //   debugPrint('Failed to get patients');
        //   return null;
        // }
      } else {
        debugPrint('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }
}
