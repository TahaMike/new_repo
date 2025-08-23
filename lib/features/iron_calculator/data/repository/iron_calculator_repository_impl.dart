import '../../domain/repository/iron_calculator_repository.dart';

class IronCalculatorRepositoryImpl extends IronCalculatorRepository {
  @override
  dynamic calculateIron(double bodyWeight, double targetHb, double actualHb) {
    double result = (2.4 * bodyWeight * (targetHb - actualHb)) + 500;
    return result;
  }
}
