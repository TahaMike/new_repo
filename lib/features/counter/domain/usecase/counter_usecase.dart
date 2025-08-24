import 'package:deficient_calculator/features/counter/domain/repository/counter_repository.dart';

class CounterUseCase {
  final CounterRepository _counterRepository ;
  const CounterUseCase(this._counterRepository);

  int counter(int num) =>  _counterRepository.counter(num);

}