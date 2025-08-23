
import '../repository/bmi_calculator_repository.dart';

class BmiCalculatorUseCase{
  final BmiCalculatorRepository _bmiCalculatorRepository;
  BmiCalculatorUseCase(this._bmiCalculatorRepository);
// hello
  dynamic calculateBmi(double weight, double height) {
    print(" ");
    print('object');
    return _bmiCalculatorRepository.calculateBmi(weight, height);
  }
}