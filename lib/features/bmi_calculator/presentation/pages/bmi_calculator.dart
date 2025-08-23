import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../provider/bmi_calculator_provider.dart';
import '../widgets/bmi_result_screen.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _heightFocusNode = FocusNode();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _weightFocusNode.dispose();
    _heightFocusNode.dispose();
    super.dispose();
  }

  String? _validatePositiveNumber(String? value, {bool strictlyPositive = false}) {
    if (value == null || value.trim().isEmpty) return 'Required';
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (strictlyPositive && parsed <= 0) return 'Must be greater than 0';
    if (!strictlyPositive && parsed < 0) return 'Cannot be negative';
    return null;
  }

  Future<void> _calculate() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final provider = context.read<BmiCalculatorProvider>();
    final double weight = double.parse(_weightController.text.trim());
    final double height = double.parse(_heightController.text.trim());
    await provider.calculateBmi(weight, height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
          tooltip: 'Back',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _weightController,
                      focusNode: _weightFocusNode,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Weight',
                        hintText: 'Enter weight in kg',
                        suffixText: 'kg',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => _validatePositiveNumber(v, strictlyPositive: true),
                      onFieldSubmitted: (_) => _heightFocusNode.requestFocus(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _heightController,
                      focusNode: _heightFocusNode,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Height',
                        hintText: 'Enter height in centimeters',
                        suffixText: 'cm',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => _validatePositiveNumber(v, strictlyPositive: true),
                      onFieldSubmitted: (_) => _calculate(),
                    ),
                    const SizedBox(height: 24),
                    Consumer<BmiCalculatorProvider>(
                      builder: (context, provider, _) {
                        return FilledButton.icon(
                          onPressed: provider.isLoading ? null : _calculate,
                          icon: provider.isLoading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                              : const Icon(Icons.calculate_rounded),
                          label: Text(provider.isLoading ? 'Calculating...' : 'Calculate'),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Consumer<BmiCalculatorProvider>(
                      builder: (context, provider, _) {
                        if (provider.isLoading) {
                          return const _LoadingCard();
                        }
                        if (provider.result == null) return const SizedBox.shrink();
                        return BmiResultScreen(bmiValue: double.parse(provider.result!));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: const [
            SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 3)),
            SizedBox(width: 12),
            Text('Calculating...'),
          ],
        ),
      ),
    );
  }
}
