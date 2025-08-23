import 'package:deficient_calculator/features/stroke_risk_calculator/presentation/stroke_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StrokeCalculator extends StatefulWidget {
  const StrokeCalculator({super.key});

  @override
  State<StrokeCalculator> createState() => _StrokeCalculatorState();
}

class _StrokeCalculatorState extends State<StrokeCalculator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _ageController = TextEditingController();

  bool? _congestiveHeartFailure;
  bool? _hyperTension;
  bool? _diabetesMellitus;
  bool? _strokeHistory;
  bool? _vascularDisease;
  bool? _sexCategoryFemale;

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  String? _validateAge(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (parsed < 0) return 'Cannot be negative';
    if (parsed > 120) return 'Unrealistic age';
    return null;
  }

  String? _validateBool(bool? value) {
    if (value == null) return 'Please select';
    return null;
  }

  Future<void> _onCalculate() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final provider = context.read<StrokeCalculatorProvider>();
    final int age = int.parse(_ageController.text.trim());
    await provider.calculateStroke(
      _congestiveHeartFailure!,
      _hyperTension!,
      age,
      _diabetesMellitus!,
      _strokeHistory!,
      _vascularDisease!,
      _sexCategoryFemale!,
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stroke Risk Calculator'),
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
            padding: EdgeInsets.zero,
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
                        _SectionHeader(title: 'Parameters'),
                        const SizedBox(height: 8),
                        _BoolDropdown(
                          label: 'Congestive Heart Failure',
                          value: _congestiveHeartFailure,
                          onChanged: (v) => setState(() => _congestiveHeartFailure = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 12),
                        _BoolDropdown(
                          label: 'Hypertension',
                          value: _hyperTension,
                          onChanged: (v) => setState(() => _hyperTension = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Age',
                            hintText: 'Enter age (years)',
                            suffixText: 'years',
                            border: OutlineInputBorder(),
                          ),
                          validator: _validateAge,
                        ),
                        const SizedBox(height: 12),
                        _BoolDropdown(
                          label: 'Diabetes Mellitus',
                          value: _diabetesMellitus,
                          onChanged: (v) => setState(() => _diabetesMellitus = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 12),
                        _BoolDropdown(
                          label: 'Stroke/TIA/Thromboembolism History',
                          value: _strokeHistory,
                          onChanged: (v) => setState(() => _strokeHistory = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 12),
                        _BoolDropdown(
                          label: 'Vascular Disease',
                          value: _vascularDisease,
                          onChanged: (v) => setState(() => _vascularDisease = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 12),
                        _BoolDropdown(
                          label: 'Sex Category (Female)',
                          value: _sexCategoryFemale,
                          onChanged: (v) => setState(() => _sexCategoryFemale = v),
                          validator: _validateBool,
                        ),
                        const SizedBox(height: 20),
                        Consumer<StrokeCalculatorProvider>(
                          builder: (context, provider, _) {
                            return FilledButton.icon(
                              onPressed: provider.isLoading ? null : _onCalculate,
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
                        Consumer<StrokeCalculatorProvider>(
                          builder: (context, provider, _) {
                            if (provider.isLoading) {
                              return const _LoadingCard();
                            }
                            if (provider.result == null) return const SizedBox.shrink();
                            return _ResultCard(scoreText: provider.result!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
}

class _BoolDropdown extends StatelessWidget {
  final String label;
  final bool? value;
  final FormFieldValidator<bool?>? validator;
  final ValueChanged<bool?> onChanged;
  const _BoolDropdown({
    required this.label,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<bool>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(value: true, child: Text('Yes')),
        DropdownMenuItem(value: false, child: Text('No')),
      ],
      onChanged: onChanged,
      validator: validator,
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

class _ResultCard extends StatelessWidget {
  final String scoreText;
  const _ResultCard({required this.scoreText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CHA₂DS₂-VASc Score', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(scoreText, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 4),
            const Text('Higher score indicates greater stroke risk.'),
          ],
        ),
      ),
    );
  }
}
