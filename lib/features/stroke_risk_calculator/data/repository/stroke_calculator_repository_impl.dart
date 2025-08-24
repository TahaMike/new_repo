import 'package:deficient_calculator/features/stroke_risk_calculator/domain/repository/stroke_calculator_repository.dart';

class StrokeCalculatorRepositoryImpl extends StrokeCalculatorRepository {
  @override
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
    score = 0;
    if (congestiveHeartFailure) score += 1;
    if (hyperTension) score += 1;
    if (age >= 75) {
      score += 2;
    } else if (age >= 65) {
      score += 1;
    }
    if (diabetesMellitus) score += 1;
    if (strokeHistory) score += 2;
    if (vascularDiasease) score += 1;
    if (sexCategory) score += 1;

    return score;
  }
}
