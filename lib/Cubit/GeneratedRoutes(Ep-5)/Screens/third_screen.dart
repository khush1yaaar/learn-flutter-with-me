import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Cubits/first_cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App - Third Screen'),
      ),
      body: Center(
        child: BlocBuilder<FirstCubit, int>(
          builder: (context, state) {
            return Text(
              'Counter: $state',
              style: const TextStyle(fontSize: 24), // Display counter value
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<FirstCubit>().incrememt(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
