import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';
import 'mock_auth.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthService authService;
//
//   LoginBloc(this.authService) : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       emit(LoginLoading());
//       try {
//         final token = await authService.login(
//           email: event.email,
//           password: event.password,
//         );
//         if (token != null) {
//           emit(LoginSuccess(token: token));
//         } else {
//           emit(LoginFailure(error: 'Login failed'));
//         }
//       } catch (e) {
//         emit(LoginFailure(error: e.toString()));
//       }
//     });
//   }
// }



import 'package:shared_preferences/shared_preferences.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc(this.authService) : super(LoginInitial()) {
    _init();
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = await authService.login(
          email: event.email,
          password: event.password,
        );
        if (token != null) {
          await _saveToken(token); // Save token to shared preferences
          emit(LoginSuccess( token: token));
        } else if (event is LogoutButtonPressed) {
          authService.logout();

          emit (LogoutSuccess());
        }
        else {
          emit(LoginFailure( error: 'Login failed'));
        }
      } catch (e) {
        emit(LoginFailure( error: e.toString()));
      }
    }

    );
  }

  SharedPreferences? _prefs;

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveToken(String token) async {
    await _prefs?.setString('token', token);
  }
}
