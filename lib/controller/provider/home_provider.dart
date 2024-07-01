import 'package:flutter/material.dart';
import 'package:task/controller/services/home_service.dart';
import 'package:task/model/home_model.dart';
import 'package:task/view/widgets/secrets.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  String? get error => _error;
  bool get isLoding => _isLoading;

  List<Result>? _resultList = [];

  List<Result>? get resultList => _resultList;

  HomeService homeService = HomeService();

  Future<void> fetchHomeList() async {
    _isLoading = true;
    notifyListeners();
    List<Result>? data = await homeService.getData(Secrets.token);

    if (data != null) {
      data = _resultList;
    } else {
      error.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
