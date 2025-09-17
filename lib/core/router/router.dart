import 'package:deficient_calculator/core/router/route_names.dart';
import 'package:deficient_calculator/features/api_example/data/repository/api_repository_impl.dart';
import 'package:deficient_calculator/features/api_example/domain/usecase/api_usecase.dart';
import 'package:deficient_calculator/features/api_example/presentation/pages/api_example.dart';
import 'package:deficient_calculator/features/api_example/presentation/provider/api_example_provider.dart';
import 'package:deficient_calculator/features/news_app/data/repository/news_repository_impl.dart';
import 'package:deficient_calculator/features/news_app/domain/usecase/news_use_case.dart';
import 'package:deficient_calculator/features/news_app/presentation/pages/news_page.dart';
import 'package:deficient_calculator/features/news_app/presentation/provider/news_provider.dart';
import 'package:deficient_calculator/features/weather_app/data/repository/weather_app_repository_impl.dart';
import 'package:deficient_calculator/features/weather_app/domain/use_case/weather_use_case.dart';
import 'package:deficient_calculator/features/weather_app/presentation/pages/weather_home_page.dart';
import 'package:deficient_calculator/features/weather_app/presentation/provider/weather_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/bmi_calculator/data/repository/bmi_calculator_repository_impl.dart';
import '../../features/bmi_calculator/domain/usecases/bmi_calculator_usecase.dart';
import '../../features/bmi_calculator/presentation/pages/bmi_calculator.dart';
import '../../features/bmi_calculator/presentation/provider/bmi_calculator_provider.dart';
import '../../features/counter/data/repository/counter_repository_impl.dart';
import '../../features/counter/domain/usecase/counter_usecase.dart';
import '../../features/counter/presentation/pages/counter.dart';
import '../../features/counter/presentation/provider/counter_provider.dart';
import '../../features/home_screen.dart';
import '../../features/iron_calculator/data/repository/iron_calculator_repository_impl.dart';
import '../../features/iron_calculator/domain/usecase/iron_calculator_usecase.dart';
import '../../features/iron_calculator/presentation/pages/iron_calculator.dart';
import '../../features/splash_screen.dart';
import '../../features/iron_calculator/presentation/provider/iron_calculator_provider.dart';
import '../../features/stroke_risk_calculator/data/repository/stroke_calculator_repository_impl.dart';
import '../../features/stroke_risk_calculator/domain/usecases/stroke_calculator_usecase.dart';
import '../../features/stroke_risk_calculator/presentation/stroke_calculator.dart';
import '../../features/stroke_risk_calculator/presentation/stroke_calculator_provider.dart';
import '../../features/todo_app/data/repository/todo_repository_impl.dart';
import '../../features/todo_app/domain/usecase/todo_usecase.dart';
import '../../features/todo_app/presentation/pages/todo_screen.dart';
import '../../features/todo_app/presentation/provider/todo_provider.dart';

final _routeNavigator = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    navigatorKey: _routeNavigator,

    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        pageBuilder: (context, state) => _buildTransitionPage(key: state.pageKey, child: SplashScreen(), transition: _RouteTransition.fade),
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) => _buildTransitionPage(key: state.pageKey, child: HomeScreen(), transition: _RouteTransition.fade),
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
          return _buildTransitionPage(key: state.pageKey, child: pageChild, transition: _RouteTransition.fadeSlide);
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
          return _buildTransitionPage(key: state.pageKey, child: pageChild, transition: _RouteTransition.fadeSlide);
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
          return _buildTransitionPage(key: state.pageKey, child: pageChild, transition: _RouteTransition.fadeSlide);
        },
      ),
      //
      GoRoute(
        path: RouteNames.counter,
        name: RouteNames.counter,
        pageBuilder: (context, state) {
          final CounterUseCase counterUseCase = CounterUseCase(CounterRepositoryImpl());
          final pageChild = ChangeNotifierProvider(create: (_) => CounterProvider(counterUseCase), builder: (context, child) => Counter());
          return _buildTransitionPage(key: state.pageKey, child: pageChild, transition: _RouteTransition.fadeSlide);
        },
      ),

      GoRoute(
        path: RouteNames.todoapp,
        name: RouteNames.todoapp,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ChangeNotifierProvider(create: (_) => TodoProvider(TodoUseCase(TodoRepositoryImpl())), builder: (context, child) => TodoScreen()),
          );
        },
      ),
      GoRoute(
        path: RouteNames.apiExample,
        name: RouteNames.apiExample,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ChangeNotifierProvider(
              create: (_) => ApiProvider(ApiUseCase(ApiRepositoryImpl())),
              builder: (context, child) => ApiExample(),
            )
          );
        }
      ),
      GoRoute(
        path: RouteNames.newsApp,
        name: RouteNames.newsApp,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ChangeNotifierProvider(
              create: (_) => NewsProvider(NewsUseCase(NewsRepositoryImpl())),
              builder: (context, child) => NewsPage(),
            )
          );
        }
      ),
      GoRoute(
        path: RouteNames.weatherApp,
        name: RouteNames.weatherApp,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ChangeNotifierProvider(
              create: (_) => WeatherProvider(WeatherUseCase(WeatherRepositoryImpl())),
              builder: (context, child) => WeatherHomePage(),
            )
          );
        }
      ),
    ],
  );

  static CustomTransitionPage _buildTransitionPage({required LocalKey key, required Widget child, required _RouteTransition transition}) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transition) {
          case _RouteTransition.fade:
            return FadeTransition(opacity: animation, child: child);
          case _RouteTransition.fadeSlide:
            final offsetTween = Tween<Offset>(begin: const Offset(0.05, 0.02), end: Offset.zero).chain(CurveTween(curve: Curves.easeOut));
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
