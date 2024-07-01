import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/controller/services/login_service.dart';
import 'package:task/model/login_model.dart';
import 'package:task/view/pages/home_page.dart';
import 'package:task/view/widgets/secrets.dart';

class LoginProvider extends ChangeNotifier {
  bool _isloading = false;
  String? _error;
  bool get isloading => _isloading;
  String? get error => _error;

  // List<LoginModel> _loginList = [];
  // List<LoginModel> get loginList => _loginList;

  Future<void> loginData(
    BuildContext context, {
    required String country_code,
    required String phone,
  }) async {
    _isloading = true;
    _error = null;
    notifyListeners();
    LoginService loginService = LoginService();

    LoginModel? loginResponse = await loginService.getData();

    if (loginResponse != null && loginResponse.status == true) {
      if (loginResponse.token!.access != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();

        await pref.setString('access', loginResponse.token!.access!);

        Secrets.token == loginResponse.token!.access;

        debugPrint('Token stored successfully');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const HomePage();
          }),
        );
      }
    } else {
      _error =
          loginResponse?.token!.access == null ? 'Login failed' : 'success';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_error!)),
      );
    }
    notifyListeners();
  }
}
