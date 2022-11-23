
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iger/services/register/register_bloc.dart';

class ServiceFactory extends StatelessWidget {
  final Widget child;
  const ServiceFactory({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        // BlocProvider<AuthenticationBloc>(
        //   create: (context) => AuthenticationBloc(
        //     firebaseAuth: context.read<FirebaseAuth>(),
        //   ),
        // ),
        // BlocProvider<FirestoreBloc>(
        //   create: (context) => FirestoreBloc(
        //     firebaseFirestore: context.read<FirebaseFirestore>(),
        //   ),
        // ),
        // BlocProvider<StorageBloc>(
        //   create: (context) => StorageBloc(
        //     firebaseStorage: context.read<FirebaseStorage>(),
        //   ),
        // ),
        // BlocProvider<FunctionsBloc>(
        //   create: (context) => FunctionsBloc(
        //     firebaseFunctions: context.read<FirebaseFunctions>(),
        //   ),
        // ),
      ],
      child: child,
    );
  }
}
