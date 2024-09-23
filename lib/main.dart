import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/blocs/internet_bloc/internet_bloc.dart';
import 'package:socials/BLoC/home_screen.dart';
import 'package:socials/ResponsiveLayout/LayoutOne/layout_one.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socials/StateManagement/notifier_provider.dart';
//import 'package:socials/StateManagement/riverpod_screen.dart';
import 'package:socials/StateManagement/state_notifier.dart';
// import 'package:socials/Theme/theme_screen.dart';
// import 'package:socials/Theme/themes.dart';

// void main() {
//   runApp(ProviderScope(child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RiverpodScreen(),
//     );
//   }
// }

final numberProvider = Provider<int>((ref) {
  return 42;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 42;
});

final numberNotifierProvider =
    StateNotifierProvider<NumbersNotifier, List<int>>((ref) {
  return NumbersNotifier();
});

final numbersChangeNotifierProvider =
    ChangeNotifierProvider<NumbersChangeNotifier>((ref) {
  return NumbersChangeNotifier();
});

// ---------------------------------ENABLE FOR THEME-------------------------------------
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     currentTheme.addListener(() {
//       setState(() {});
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const ThemeScreen(),
//       title: 'Flutter Learning Path',
//       theme: CustomTheme.lightTheme,
//       darkTheme: CustomTheme.darkTheme,
//       themeMode: currentTheme.currentTheme,
//     );
//   }
// }
// ------------------------------------------------ FOR RESPONSIVE LAYOUT ------------------------------------------
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: LayoutOne(),
//     );
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
