import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socials/StateManagement/riverpod_screen.dart';
import 'package:socials/StateManagement/state_notifier.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiverpodScreen(),
    );
  }
}

final numberProvider = Provider<int>((ref) {
  return 42;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 42;
});

final numberNotifierProvider = StateNotifierProvider<NumbersNotifier,List<int>>((ref) {
  return NumbersNotifier();
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