import 'package:firebase_first_project/model/auth_repo.dart';
import 'package:firebase_first_project/utils/form_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo _authRepo;
  SignUpBloc(this._authRepo) : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    //
    on<SignUpReset>(_onSignUpReset);
    //
    on<InitiSingUpScreenEvent>(_onSignUpIniti);
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final emailError = SignUpValidator.validateEmail(event.email);
      final passwordError = SignUpValidator.validatePassword(event.password);
      final confirmPasswordError = SignUpValidator.validateConfirmPassword(
          event.password, event.confirmPassword);

      if (emailError == null &&
          passwordError == null &&
          confirmPasswordError == null) {
        final user = await _authRepo.signUpWithEmailAndPassword(
          email: event.email,
          password: event.password,
          // name: event.name, // Assuming name is passed in the event
          name: "name",
        );

        if (user != null) {
          emit(SignUpSuccess(event.email));
        } else {
          emit(SignUpFailure("Registration failed. Please try again."));
        }
      }
    } catch (e) {
      emit(SignUpFailure("Something went wrong. ${e.toString()}"));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpIniti(InitiSingUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
