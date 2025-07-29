import 'package:firebase_first_project/auth/bloc_login/login_bloc.dart';
import 'package:firebase_first_project/auth/bloc_signup/signup_bloc.dart';
import 'package:firebase_first_project/auth/features/signup_screen.dart';
import 'package:firebase_first_project/model/auth_repo.dart';
import 'package:firebase_first_project/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignUpBloc(authRepo),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo),
        ),
      ],
      child: MaterialApp(
        title: 'SignUp App',
        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SignUpScreen(),
      ),
    );
  }
}
