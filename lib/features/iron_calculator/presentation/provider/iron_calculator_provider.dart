import 'package:flutter/cupertino.dart';

import '../../domain/usecase/iron_calculator_usecase.dart';

class IronCalculatorProvider extends ChangeNotifier {
  final IronCalculatorUseCase ironCalculatorUseCase;

  IronCalculatorProvider(this.ironCalculatorUseCase);

  String? _result;
  bool _isLoading = false;

  String? get result => _result;
  bool get isLoading => _isLoading;

  Future<void> calculateIron(
    double bodyWeight,
    double targetHb,
    double actualHb,
  ) async {
    _isLoading = true;
    _result = null;
    notifyListeners();

    // Brief delay so the loading state is visible in fast calculations
    await Future.delayed(const Duration(milliseconds: 300));

    final dynamic rawDynamic = ironCalculatorUseCase.calculateIron(bodyWeight, targetHb, actualHb);
    final double raw = rawDynamic is num
        ? rawDynamic.toDouble()
        : double.tryParse(rawDynamic.toString()) ?? 0.0;

    final double clamped = raw < 0 ? 0 : raw;
    _result = clamped.toStringAsFixed(2);

    _isLoading = false;
    notifyListeners();
  }
}
