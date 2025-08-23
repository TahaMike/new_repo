
import '../repository/iron_calculator_repository.dart';

class IronCalculatorUseCase {
  final IronCalculatorRepository _ironCalculatorRepository;
  IronCalculatorUseCase(this._ironCalculatorRepository);

  dynamic calculateIron(double bodyWeight, double targetHb, double actualHb) {
    return _ironCalculatorRepository.calculateIron(bodyWeight, targetHb, actualHb);
  }
}
