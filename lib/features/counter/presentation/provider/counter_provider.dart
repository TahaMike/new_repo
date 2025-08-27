import 'package:deficient_calculator/features/counter/domain/usecase/counter_usecase.dart';
import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  final CounterUseCase _counterUseCase;
  CounterProvider(this._counterUseCase);
  int _num=0;
  int get num => _num;

  UpdateNum(){
    _num = _counterUseCase.counter(_num);
    notifyListeners();
  }
}