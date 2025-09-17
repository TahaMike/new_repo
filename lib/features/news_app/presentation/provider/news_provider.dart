
import 'package:flutter/material.dart';

import '../../domain/entities/news_entity_model.dart';
import '../../domain/usecase/news_use_case.dart';

class NewsProvider extends ChangeNotifier {
  final NewsUseCase _newsUseCase;
  NewsProvider(this._newsUseCase);

  final List<NewsApiDomainModel> _newsList = [];
  List<NewsApiDomainModel> get newsList => _newsList;

  Future<void> getNewsData() async{
    print('Api Provider hit');
    _newsList.clear();
    final newsDataFromApi = await _newsUseCase.getNewsFromApi();
    _newsList.addAll(newsDataFromApi);
    print('provider list added');
    notifyListeners();
  }

}