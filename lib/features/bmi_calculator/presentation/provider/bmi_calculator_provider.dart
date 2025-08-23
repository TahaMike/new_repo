import 'package:flutter/widgets.dart';

import '../../domain/usecases/bmi_calculator_usecase.dart';

class BmiCalculatorProvider extends ChangeNotifier{
  final BmiCalculatorUseCase bmiCalculatorUseCase;
  BmiCalculatorProvider(this.bmiCalculatorUseCase);

  String? _result;
  bool _isLoading = false;

  String? get result => _result;
  bool get isLoading => _isLoading;

  Future<void> calculateBmi(
      double weight,
      double height
      ) async {
    _isLoading = true;
    _result = null;
    notifyListeners();

    // Brief delay so the loading state is visible in fast calculations
    await Future.delayed(const Duration(milliseconds: 300));

    final dynamic rawDynamic = bmiCalculatorUseCase.calculateBmi(weight, height);
    final double raw = rawDynamic is num
        ? rawDynamic.toDouble()
        : double.tryParse(rawDynamic.toString()) ?? 0.0;

    final double clamped = raw < 0 ? 0 : raw;
    _result = clamped.toStringAsFixed(2);

    _isLoading = false;
    notifyListeners();
  }
}