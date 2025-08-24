import 'package:deficient_calculator/features/counter/presentation/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, CounterProvider value, Widget? child) {
          return Center(child: Text(value.num.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CounterProvider>().UpdateNum();
      }, child: Icon(Icons.add)),
    );
  }
}
