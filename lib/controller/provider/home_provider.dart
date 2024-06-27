import 'package:flutter/material.dart';
import 'package:task/controller/services/home_service.dart';
import 'package:task/model/home_model.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoding => _isLoading;

  List<Result>? _resultList = [];

  List<Result>? get resultList => _resultList;

  HomeService homeService = HomeService();

  Future<void> fetchHomeList() async {
    _isLoading = true;
    notifyListeners();
    _resultList = (await homeService.getData())!;

    _isLoading = false;
    notifyListeners();
  }
}
