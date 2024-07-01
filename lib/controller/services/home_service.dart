import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/home_model.dart';

class HomeService {
  // Future<List<Result>?> getHomeData(String token) async {
  //   try {
  //     var headers = {
  //       'Authorization': 'Bearer $token',

  //     };
  //     var url = 'https://frijo.noviindus.in/api/home';
  //     var response = await http.get(Uri.parse(url), headers: headers);

  //     print(response.body);
  //     // response.headers.addAll(headers);

  //     if (response.statusCode == 200) {
  //       HomeModel homeModel = homeModelFromJson(response.body);
  //       return homeModel.results;
  //     }
  //   } catch (error, st) {
  //     print(error.toString());
  //     print(st);
  //     throw Error();
  //   }
  //   return null;
  // }

  Future<List<Result>?> getData(String token) async {
    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var request =
          http.Request('GET', Uri.parse('https://frijo.noviindus.in/api/home'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 202) {
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
