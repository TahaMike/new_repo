import '../../data/model/api_model.dart';
import '../entities/api_entity.dart';

abstract class ApiRepository {
  Future<List<ApiModel>> getEmployeeData();

  Future<ApiEntity> addEmployeeData(ApiModel employee);

  Future<void> deleteEmployeeData(String id);
}
