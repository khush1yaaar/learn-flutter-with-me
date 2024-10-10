import 'package:flutter/material.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/otp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.blue, // Blue color for AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone, // Changed to phone input type
            ),
            const SizedBox(height: 20), // Space between text field and button
            ElevatedButton(
              onPressed: () {
                // Action for the button
                // String phoneNumber = _phoneController.text;
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Phone number entered: $phoneNumber')),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPScreen())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color for the button
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Sign In', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
