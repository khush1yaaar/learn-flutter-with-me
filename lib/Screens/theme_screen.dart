import 'package:flutter/material.dart';
import 'package:socials/themes.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Learning Path'),
        actions: [
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
           icon: CustomTheme.isDarkTheme ? Icon(Icons.sunny) : Icon(Icons.brightness_3_rounded) ,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'hehe Theming ho gayi',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}