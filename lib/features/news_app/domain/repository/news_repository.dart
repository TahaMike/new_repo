
import '../entities/news_entity_model.dart';

abstract class NewsRepository {
  Future<List<NewsApiDomainModel>> getNewsFromApi();

  Future<NewsApiDomainModel> getDetailsOfNews(String id);
}