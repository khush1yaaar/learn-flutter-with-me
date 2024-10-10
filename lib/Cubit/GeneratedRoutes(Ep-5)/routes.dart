import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Cubits/first_cubit.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Cubits/second_cubit.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Screens/first_screen.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Screens/second_screen.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Screens/third_screen.dart';

class Routes {

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ));
      case "/second":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SecondCubit(),
                  child: SecondScreen(),
                ));
      case "/third":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: ThirdScreen(),
                ));
    }
    return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ));
  }
}
