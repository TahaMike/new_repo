
import '../../domain/repository/bmi_calculator_repository.dart';

class BmiCalculatorRepositoryImpl extends BmiCalculatorRepository {
  @override
  dynamic calculateBmi(double weight, double height) {
    // Convert height from centimeters to meters
    double heightInMeters = height / 100;
    double result = weight / (heightInMeters * heightInMeters);
    return result;
  }
}
