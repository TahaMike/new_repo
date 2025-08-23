import 'package:deficient_callculator/core/router/route_names.dart';
import 'package:deficient_callculator/features/home_screen.dart';
import 'package:deficient_callculator/features/iron_calculator/presentation/pages/iron_calculator.dart';
import 'package:deficient_callculator/features/stroke_risk_calculator/data/repository/stroke_calculator_repository_impl.dart';
import 'package:deficient_callculator/features/stroke_risk_calculator/domain/usecases/stroke_calculator_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/bmi_calculator/data/repository/bmi_calculator_repository_impl.dart';
import '../../features/bmi_calculator/domain/usecases/bmi_calculator_usecase.dart';
import '../../features/bmi_calculator/presentation/pages/bmi_calculator.dart';
import '../../features/bmi_calculator/presentation/provider/bmi_calculator_provider.dart';
import '../../features/iron_calculator/data/repository/iron_calculator_repository_impl.dart';
import '../../features/iron_calculator/domain/usecase/iron_calculator_usecase.dart';
import '../../features/splash_screen.dart';
import '../../features/iron_calculator/presentation/provider/iron_calculator_provider.dart';
import '../../features/stroke_risk_calculator/presentation/stroke_calculator.dart';
import '../../features/stroke_risk_calculator/presentation/stroke_calculator_provider.dart';

final _routeNavigator = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    navigatorKey: _routeNavigator,

    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        pageBuilder: (context, state) => _buildTransitionPage(
          key: state.pageKey,
          child: SplashScreen(),
          transition: _RouteTransition.fade,
        ),
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) => _buildTransitionPage(
          key: state.pageKey,
          child: HomeScreen(),
          transition: _RouteTransition.fade,
        ),
      ),
      GoRoute(
        path: RouteNames.ironCalculator,
        name: RouteNames.ironCalculator,
        pageBuilder: (context, state) {
          final IronCalculatorUseCase ironCalculatorUseCase = IronCalculatorUseCase(IronCalculatorRepositoryImpl());
          final pageChild = ChangeNotifierProvider(
            create: (_) => IronCalculatorProvider(ironCalculatorUseCase),
            builder: (context, child) => IronCalculator(),
          );
          return _buildTransitionPage(
            key: state.pageKey,
            child: pageChild,
            transition: _RouteTransition.fadeSlide,
          );
        },
      ),
      GoRoute(
        path: RouteNames.strokeCalculator,
        name: RouteNames.strokeCalculator,
        pageBuilder: (context, state) {
          final StrokeCalculatorUseCase strokeCalculatorUseCase = StrokeCalculatorUseCase(StrokeCalculatorRepositoryImpl());
          final pageChild = ChangeNotifierProvider(
            create: (_) => StrokeCalculatorProvider(strokeCalculatorUseCase),
            builder: (context, child) => StrokeCalculator(),
          );
          return _buildTransitionPage(
            key: state.pageKey,
            child: pageChild,
            transition: _RouteTransition.fadeSlide,
          );
        },
      ),
      GoRoute(
        path: RouteNames.bmiCalculator,
        name: RouteNames.bmiCalculator,
        pageBuilder: (context, state) {
          final BmiCalculatorUseCase bmiCalculatorUseCase = BmiCalculatorUseCase(BmiCalculatorRepositoryImpl());
          final pageChild = ChangeNotifierProvider(
            create: (_) => BmiCalculatorProvider(bmiCalculatorUseCase),
            builder: (context, child) => BmiCalculator(),
          );
          return _buildTransitionPage(
            key: state.pageKey,
            child: pageChild,
            transition: _RouteTransition.fadeSlide,
          );
        },
      ),
    ],
  );

  static CustomTransitionPage _buildTransitionPage({
    required LocalKey key,
    required Widget child,
    required _RouteTransition transition,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transition) {
          case _RouteTransition.fade:
            return FadeTransition(opacity: animation, child: child);
          case _RouteTransition.fadeSlide:
            final offsetTween = Tween<Offset>(begin: const Offset(0.05, 0.02), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut));
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: animation.drive(offsetTween), child: child),
            );
        }
      },
    );
  }
}

enum _RouteTransition { fade, fadeSlide }
