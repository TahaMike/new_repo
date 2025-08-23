import 'package:deficient_callculator/features/stroke_risk_calculator/domain/repository/stroke_calculator_repository.dart';

class StrokeCalculatorUseCase {
  final StrokeCalculatorRepository _strokeCalculatorRepository;

  StrokeCalculatorUseCase(this._strokeCalculatorRepository);

  dynamic calculateStroke(
    bool congestiveHeartFailure,
    bool hyperTension,
    int age,
    bool diabetesMellitus,
    bool strokeHistory,
    bool vascularDiasease,
    bool sexCategory,
    int score,
  ) {
    return _strokeCalculatorRepository.calculateStroke(
      congestiveHeartFailure,
      hyperTension,
      age,
      diabetesMellitus,
      strokeHistory,
      vascularDiasease,
      sexCategory,
      score,
    );
  }
}
