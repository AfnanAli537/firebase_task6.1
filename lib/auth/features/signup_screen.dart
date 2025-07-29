import 'package:firebase_first_project/auth/bloc_signup/signup_bloc.dart';
import 'package:firebase_first_project/auth/features/login_screen.dart';
import 'package:firebase_first_project/utils/app_strings.dart';
import 'package:firebase_first_project/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signUp),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpFailure) {
                Fluttertoast.showToast(
                  msg: state.error,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  // backgroundColor: Colors.red,
                  webBgColor: "linear-gradient( #FF5252, #FF1744)",
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else if (state is SignUpSuccess) {
                Fluttertoast.showToast(
                  msg: "sign up successful using email: ${state.email}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  // backgroundColor: const Color.fromARGB(255, 76, 175, 80),
                  webBgColor: "linear-gradient( #B2FF59)",
                  textColor: Colors.white,
                  fontSize: 16.0,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
            builder: (context, state) {
              if (state is SignUpLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: AppStrings.email,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: SignUpValidator.validateEmail,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: AppStrings.password,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: SignUpValidator.validatePassword,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: AppStrings.confirmPassword,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) =>
                                  SignUpValidator.validateConfirmPassword(
                                _passwordController.text,
                                value,
                              ),
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignUpBloc>().add(
                                          SignUpSubmittedEvent(
                                            email: _emailController.text.trim(),
                                            password:
                                                _passwordController.text.trim(),
                                            confirmPassword:
                                                _confirmPasswordController.text
                                                    .trim(),
                                          ),
                                        );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: AppStrings.formErrors,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      // backgroundColor: Colors.orange,
                                      webBgColor: "linear-gradient(#FF9800)",
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                                },
                                child: const Text(AppStrings.signUpButton),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
