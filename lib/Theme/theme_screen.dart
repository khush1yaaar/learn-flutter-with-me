import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:socials/Theme/themes.dart'; // Importing a custom theme package (assumed to be defined elsewhere).

// Defining a stateful widget named ThemeScreen.
class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key}); // Constructor for the widget.

  @override
  State<ThemeScreen> createState() => _ThemeScreenState(); // Creating the state for the widget.
}

// State class for ThemeScreen.
class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Learning Path'), // Title of the app bar.
        actions: [
          IconButton(
            onPressed: () {
              // Toggling the theme when the button is pressed.
              currentTheme.toggleTheme();
            },
            // Conditionally setting the icon based on the current theme.
            icon: CustomTheme.isDarkTheme 
              ? Icon(Icons.sunny) // Icon for light theme.
              : Icon(Icons.brightness_3_rounded), // Icon for dark theme.
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centering the column content.
          children: <Widget>[
            // Displaying a text in the center of the screen.
            Text(
              'hehe Theming ho gayi',
              style: Theme.of(context).textTheme.headlineMedium, // Using the theme's text style.
            ),
          ],
        ),
      ),
    );
  }
}
