// import 'dart:convert';
//
//
// import 'package:deficient_calculator/features/news_app/data/model/news_data_model.dart';
//
// import '../../../../core/constant/api_constant.dart';
// import '../../../../core/services/news_api_service.dart';
// import '../../domain/entities/news_entity_model.dart';
// import '../../domain/repository/news_repository.dart';
//
// class NewsRepositoryImpl extends NewsRepository {
//   @override
//   Future<List<NewsApiDomainModel>> getNewsFromApi() async {
//     print('api repo impl hit');
//     final response = await NewsApiService.instance.get(ApiConstant.newsApiUrl);
//     if (response.statusCode != 200) throw response.body?? 'something went wrong';
//     final newsList = jsonDecode(response.body);
//     print(response.body);
//     return newsList['articles'].map<NewsApiDataModel>((element) => NewsApiDataModel.fromJson(element));
//   }
//
//   // @override
//   // Future getDetailsOfNews() {
//   //   // TODO: implement getNewsFromApi
//   //   throw UnimplementedError();
//   // }
// }

import 'dart:convert';

import 'package:deficient_calculator/features/news_app/data/model/news_data_model.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/services/news_api_service.dart';
import '../../domain/entities/news_entity_model.dart';
import '../../domain/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<List<NewsApiDomainModel>> getNewsFromApi() async {
    print('api repo impl hit');
    final response = await NewsApiService.instance.get(ApiConstant.newsApiUrl);
    if (response.statusCode != 200) throw response.body ?? 'something went wrong';

    final decoded = jsonDecode(response.body);
    final List articles = decoded['articles'] ?? [];
    final newsList = articles.map((element) => NewsApiDataModel.fromJson(element).toEntity()).toList();
    print('Api repo successfully hit');
    return newsList;
  }

  @override
  Future<NewsApiDomainModel> getDetailsOfNews(String id) async {
    throw UnimplementedError();
    final response = await NewsApiService.instance.get(ApiConstant.newsApiUrl);
    return response as NewsApiDomainModel;
  }
}
