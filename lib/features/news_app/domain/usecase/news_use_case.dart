
import 'package:deficient_calculator/features/news_app/data/model/news_data_model.dart';
import 'package:deficient_calculator/features/news_app/domain/entities/news_entity_model.dart';

import '../repository/news_repository.dart';

class NewsUseCase {
  final NewsRepository _newsRepository;
  NewsUseCase(this._newsRepository);

  Future<List<NewsApiDomainModel>> getNewsFromApi() async{
    print('Api use case hit');
    return await _newsRepository.getNewsFromApi();
  }

  Future<NewsApiDomainModel> getDetailOfSingleArticle(String id) async {
    return await _newsRepository.getDetailsOfNews(id);
  }

}