import 'package:deficient_calculator/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        // backgroundColor:AppTheme.bgColor?.withOpacity(0.68),
        // shadowColor: AppTheme.primaryColor.withOpacity(0.8),
        title: Text('Different Calculator'),
        centerTitle: true,
        // leading: IconButton(onPressed: () {
        // }, icon: Icon(Icons.restart_alt)),
      ),
      body: AnimatedContainer(
        height: double.maxFinite,
        width: double.maxFinite,
        duration: Duration(milliseconds: 300),
        // decoration: BoxDecoration(
        //   color: AppTheme.bgColor?.withOpacity(0.58),
        // ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CalculatorCard(
                    title: 'Iron Deficit Calculator',
                    icon: Icons.science_rounded,
                    onTap: () => context.push(RouteNames.ironCalculator),
                  ),
                  const SizedBox(height: 12),
                  _CalculatorCard(
                    title: 'Stroke Risk Calculator',
                    icon: Icons.monitor_heart_rounded,
                    onTap: () => context.push(RouteNames.strokeCalculator),
                  ),
                  const SizedBox(height: 12),
                  _CalculatorCard(
                      title: 'BMI Calculator',
                      icon: Icons.person_2_outlined,
                      onTap: () => context.push(RouteNames.bmiCalculator)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CalculatorCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CalculatorCard({required this.title, required this.icon, required this.onTap});

  @override
  State<_CalculatorCard> createState() => _CalculatorCardState();
}

class _CalculatorCardState extends State<_CalculatorCard> {
  bool _pressed = false;

  void _setPressed(bool v) {
    setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: _pressed ? 0.98 : 1.0,
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: widget.onTap,
          onTapDown: (_) => _setPressed(true),
          onTapCancel: () => _setPressed(false),
          onTapUp: (_) => _setPressed(false),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Icon(widget.icon, size: 28),
                const SizedBox(width: 12),
                Expanded(child: Text(widget.title, style: Theme.of(context).textTheme.titleMedium)),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
