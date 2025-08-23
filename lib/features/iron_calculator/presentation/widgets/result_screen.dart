import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../provider/iron_calculator_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IronCalculatorProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Column(
            children: [
              // SizedBox(height: 30,),
              SpinKitCircle(size: 50, duration: Duration(milliseconds: 1500), color: Theme.of(context).primaryColor),
              SizedBox(height: 30,)
            ],
          );
        }

        if (provider.result == null) {
          return const SizedBox.shrink();
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: Card(
            key: const ValueKey('result-card'),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total iron deficit', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('${provider.result!} mg', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  const Text('Result is clamped to not fall below 0 mg.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class _LoadingCard extends StatelessWidget {
//   const _LoadingCard();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 30,),
//         SpinKitCircle(size: 50, duration: Duration(milliseconds: 1500), color: Theme.of(context).primaryColor),
//         SizedBox(height: 30,)
//       ],
//     );
//   }
// }
