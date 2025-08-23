
import '../repository/bmi_calculator_repository.dart';

class BmiCalculatorUseCase{
  final BmiCalculatorRepository _bmiCalculatorRepository;
  BmiCalculatorUseCase(this._bmiCalculatorRepository);

  dynamic calculateBmi(double weight, double height) {
    return _bmiCalculatorRepository.calculateBmi(weight, height);
  }
}