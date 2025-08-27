import 'package:deficient_calculator/features/counter/presentation/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded), onPressed: () => context.pop(), tooltip: 'Back'),
      ),
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, CounterProvider value, Widget? child) {
          return Center(child: Text(value.num.toString(), style: TextStyle(fontSize: 35)));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().UpdateNum();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
