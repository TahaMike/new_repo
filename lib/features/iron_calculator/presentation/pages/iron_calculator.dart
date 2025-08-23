import '../../../../core/widgets/text_related_widgets.dart';
import '../widgets/result_screen.dart';
import '../provider/iron_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class IronCalculator extends StatefulWidget {
  const IronCalculator({super.key});

  @override
  State<IronCalculator> createState() => _HomePageState();
}

class _HomePageState extends State<IronCalculator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _targetHbController = TextEditingController();
  final TextEditingController _actualHbController = TextEditingController();

  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _targetHbFocusNode = FocusNode();
  final FocusNode _actualHbFocusNode = FocusNode();

  // Result is shown via provider's ResultScreen widget

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _weightController.dispose();
    _targetHbController.dispose();
    _actualHbController.dispose();
    _weightFocusNode.dispose();
    _targetHbFocusNode.dispose();
    _actualHbFocusNode.dispose();
    super.dispose();
  }

  String? _requiredPositiveNumber(String? value, {bool strictlyPositive = false}) {
    if (value == null || value.trim().isEmpty) return 'Required';
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (strictlyPositive && parsed <= 0) return 'Must be greater than 0';
    if (!strictlyPositive && parsed < 0) return 'Cannot be negative';

    return null;
  }

  void _calculate() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final double bodyWeight = double.parse(_weightController.text.trim());
    final double targetHb = double.parse(_targetHbController.text.trim());
    final double actualHb = double.parse(_actualHbController.text.trim());

    final homeProvider = context.read<IronCalculatorProvider>();
    homeProvider.calculateIron(bodyWeight, targetHb, actualHb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Iron Deficit Calculator'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
          tooltip: 'Back',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(top: 10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
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
                            customTextFormField(
                              labelText: "BodyWeight",
                              hintText: 'Enter Weight in kg',
                              suffixText: 'kg',
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                              textInputAction: TextInputAction.next,
                              controller: _weightController,
                              focusNode: _weightFocusNode,

                              validator: (v) => _requiredPositiveNumber(v, strictlyPositive: true),
                            ),
                            const SizedBox(height: 16),
                            customTextFormField(
                              labelText: 'Target Hb',
                              hintText: 'Enter target Hb (g/dL)',
                              suffixText: 'g/dL',
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                              textInputAction: TextInputAction.next,
                              controller: _targetHbController,
                              focusNode: _targetHbFocusNode,

                              validator: (v) => _requiredPositiveNumber(v, strictlyPositive: true),
                            ),
                            const SizedBox(height: 16),
                            customTextFormField(
                              labelText: 'Actual Hb',
                              hintText: 'Enter actual Hb (g/dL)',
                              suffixText: 'g/dL',
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                              textInputAction: TextInputAction.next,
                              controller: _actualHbController,
                              focusNode: _actualHbFocusNode,

                              validator: (v) => _requiredPositiveNumber(v, strictlyPositive: true),
                            ),
                            const SizedBox(height: 24),
                            FilledButton.icon(onPressed: _calculate, icon: const Icon(Icons.calculate_rounded), label: const Text('Calculate')),
                            const SizedBox(height: 16),
                            ResultScreen(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
