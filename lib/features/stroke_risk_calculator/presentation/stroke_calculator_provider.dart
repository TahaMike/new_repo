import 'package:deficient_callculator/features/stroke_risk_calculator/domain/usecases/stroke_calculator_usecase.dart';
import 'package:flutter/cupertino.dart';

class StrokeCalculatorProvider extends ChangeNotifier {
  final StrokeCalculatorUseCase _strokeCalculatorUseCase;

  StrokeCalculatorProvider(this._strokeCalculatorUseCase);

  String? _result;
  bool _isLoading = false;

  String? get result => _result;

  bool get isLoading => _isLoading;

  Future<void> calculateStroke(
    bool congestiveHeartFailure,
    bool hyperTension,
    int age,
    bool diabetesMellitus,
    bool strokeHistory,
    bool vascularDiasease,
    bool sexCategory,
    int score,
  ) async {
    _isLoading = true;
    _result = null;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));

    final dynamic rawDynamic = _strokeCalculatorUseCase.calculateStroke(
      congestiveHeartFailure,
      hyperTension,
      age,
      diabetesMellitus,
      strokeHistory,
      vascularDiasease,
      sexCategory,
      score,
    );
    final double raw = rawDynamic is num
        ? rawDynamic.toDouble()
        : double.tryParse(rawDynamic.toString()) ?? 0.0;

    final double clamped = raw < 0 ? 0 : raw;
    _result = clamped.toStringAsFixed(2);

    _isLoading = false;
    notifyListeners();

  }
}
