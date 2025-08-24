import 'package:deficient_calculator/core/router/router.dart';
import 'package:deficient_calculator/features/counter/data/repository/counter_repository_impl.dart';
import 'package:deficient_calculator/features/counter/domain/usecase/counter_usecase.dart';
import 'package:deficient_calculator/features/counter/presentation/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,

    );
  }
}