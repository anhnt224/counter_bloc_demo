import 'package:counter_bloc/bloc/counter_cubit.dart';
import 'package:counter_bloc/route/route_name.dart';
import 'package:counter_bloc/screens/screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/screen_2.dart';

class AppRouter {
  AppRouter._instance();
  static final AppRouter instance = AppRouter._instance();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.screen1:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: const Screen1(),
            create: (context) => CounterCubit(),
          ),
        );
      case RouteName.screen2:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: const Screen2(),
            create: (context) => CounterCubit(),
          ),
        );
      default:
    }
    return null;
  }
}
