import 'dart:convert';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/api_entity.dart';
import '../../domain/repository/api_repository.dart';
import '../model/api_model.dart';

class ApiRepositoryImpl extends ApiRepository {
  // get api data
  @override
  Future<List<ApiModel>> getEmployeeData() async {
    final response = await ApiService.instance.get(ApiConstant.getEmployeeDataUrl);
    if (response.statusCode != 200) throw response.body ?? "Something went wrong";
    final data = jsonDecode(response.body);
    return data['data'].map((element) => ApiModel.fromJson(element)).toList();
  }

  // post api data
  @override
  Future<ApiEntity> addEmployeeData(ApiModel employee) async {
    // final model = ApiModel.fromJson(employee.toJson());

    final response = await ApiService.instance.post(ApiConstant.addEmployeeDataUrl, employee.toJson());
    if (response.statusCode != 200) throw response.body ?? "Something went wrong";

    final data = jsonDecode(response.body);
    return ApiModel.fromJson(data).toEntity();
  }

  // delete api data
  @override
  Future<void> deleteEmployeeData(String id) async {

    await ApiService.instance.delete(ApiConstant.deleteEmployeeDataUrl + id);

  }
}
