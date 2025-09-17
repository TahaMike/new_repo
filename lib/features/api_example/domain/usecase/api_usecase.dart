
import '../../data/model/api_model.dart';
import '../entities/api_entity.dart';
import '../repository/api_repository.dart';

class ApiUseCase {
  final ApiRepository _apiRepository;
  ApiUseCase(this._apiRepository);


  Future<List<ApiEntity>> getDataFromApi() async {
    return await _apiRepository.getEmployeeData() as List<ApiEntity>;
  }

  Future<ApiEntity> postEmployeeData(ApiModel employee) async {
    return await _apiRepository.addEmployeeData(employee);
  }

  Future<void> deleteEmployee(String id) async {
    return await _apiRepository.deleteEmployeeData(id);
  }

}
