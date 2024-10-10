import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/GeneratedRoutes(Ep-5)/Cubits/second_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App - Second Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pushNamed(context, '/third'); // Navigate to ThirdScreen
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<SecondCubit, int>(
          builder: (context, state) {
            return Text(
              'Counter: $state',
              style: const TextStyle(fontSize: 24), // Display counter value
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<SecondCubit>().incrememt(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
