import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iger/services/register/register_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iGer'),
      ),
      body:  BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterInitial) {
            return const Center(
              child: Text(
                'You have pushed the button this many times:',
              ),
            );
          } else if (state is RegisterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegisterSuccess) {
            return const Center(
              child: Text(
                'Success',
              ),
            );
          } else if (state is RegisterFailure) {
            return const Center(
              child: Text(
                'Failure',
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Unknown',
              ),
            );
          }
        },
        bloc: context.read<RegisterBloc>()..add(OnRegisterBloc()),
      ),
    );
  }
}
