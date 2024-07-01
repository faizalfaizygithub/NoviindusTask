import 'package:http/http.dart' as http;
import 'package:task/model/login_model.dart';

// class LoginService {
//   Future<LoginModel?> getData(
//       {required String country_code, required String phone}) async {
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://frijo.noviindus.in/api/otp_verified'),
//       );
//       request.fields.addAll({'country_code': country_code, 'phone': phone});

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 202) {
//         print(" responseError:$response");
//         String responseBody = await response.stream.bytesToString();

//         LoginModel loginModel = loginModelFromJson(responseBody);
//         return loginModel;
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (error) {
//       print(error.toString());
//     }
//     return null;
//   }
// }

class LoginService {
  Future<LoginModel?> getData() async {
    try {
      // var headers = {'Content-Type': 'application/json'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://frijo.noviindus.in/api/otp_verified'));
      request.fields.addAll({'country_code': '91', 'phone': '8129466718'});

      // request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("responsePrinted:$response");
        String responseBody = await response.stream.bytesToString();
        LoginModel loginModel = loginModelFromJson(responseBody);
        print(" responseBodyPrinted:$responseBody");
        return loginModel;
      } else {
        print("othersErrorPrinted:${response.reasonPhrase}");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
