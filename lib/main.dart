import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/data/Reposetories/post_reposetories.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/logic/Cubit/PostCubit/post_cubit.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/presentation/home_screen.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/routes.dart';
import 'package:socials/StateManagement/notifier_provider.dart';
import 'package:socials/StateManagement/state_notifier.dart';

import 'Cubit/APIHandling(Ep-6)/data/Models/post_model.dart';

//------------------------------------------------------RIVERPOD--------------------------------------------------------------------
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

//--------------------------------------------------------------BLOC - INTERNET CONNECTIVITY (EP - 1)----------------------------------------------------------------------
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InternetBloc(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen(),
//       ),
//     );
//   }
// }
//---------------------------------------------------------- CUBIT INTERNET CONNECTIVITY (EP - 2) -------------------------------------------------------------------------
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
//     return BlocProvider(
//       create: (context) => InternetCubit(), // Correctly create InternetCubit
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: SafeArea(child: HomeScreen()),
//       ),
//     );
//   }
// }
//-------------------------------------------------------------------- BLOC FORM VALIDATION (EP-3) --------------------------------------------------------------
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomeScreen(),
//     );
//   }
// }
//---------------------------------------------------------------- BLOC PHONE AUTH (EP-4)-------------------------------------------------------------
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
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
//     return BlocProvider(
//       create: (context) => AuthCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BlocBuilder<AuthCubit, AuthState>(
//           buildWhen: (oldState, newState) {
//             return oldState is AuthInitialState;
//           },
//           builder: (context, state) {
//             if (state is AuthLoggedInState) {
//               return const HomeScreen();
//             } else if (state is AuthLoggedOutState) {
//               return const SignInScreen();
//             } else {
//               return const Scaffold();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

//-----------------------------------------------------BLOC GENERATED ROUTES (EP-5)-------------------------------------------------------------------
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: Routes().onGenerateRoute,
//       initialRoute: "/first",
//     );
//   }
// }

void main() async {
  runApp(const MyApp());
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
      create: (context) => PostCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
