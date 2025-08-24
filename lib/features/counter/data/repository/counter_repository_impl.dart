import 'package:deficient_calculator/features/counter/domain/repository/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  @override
  int counter(int num) => num+=1;
}

