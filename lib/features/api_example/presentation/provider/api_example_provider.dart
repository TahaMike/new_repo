import 'package:flutter/material.dart';

import '../../data/model/api_model.dart';
import '../../domain/entities/api_entity.dart';
import '../../domain/usecase/api_usecase.dart';

class ApiProvider extends ChangeNotifier{
  final ApiUseCase _apiUseCase;
  ApiProvider(this._apiUseCase);

  final List<ApiEntity> _list = [];
  List<ApiEntity> get list => _list;
  Future<void> getData() async{
    _list.clear();
    final apiData = await _apiUseCase.getDataFromApi();
    _list.addAll(apiData);
    notifyListeners();
  }


  Future<void> postData(ApiModel employee) async {
    final newEmployee = await _apiUseCase.postEmployeeData(employee);
    _list.add(newEmployee);
    notifyListeners();
  }
}