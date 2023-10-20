import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/error.dart';
import '../../../domain/entities/token_entity.dart';
import '../../../domain/usecases/get_token.dart';
import '../../../domain/usecases/sign_in_with_email.dart';
import '../../../domain/usecases/sign_in_with_google.dart';
import '../../../domain/usecases/sign_out.dart';
import '../../../domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMessage = 'Cache Failure';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetToken getToken;
  final SignInWithEmail signInWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.getToken,
    required this.signInWithEmail,
    required this.signInWithGoogle,
    required this.signUp,
    required this.signOut,
  }) : super(UnAuthenticatedState()) {
    on<GetTokenEvent>(_getToken);
    on<SignInWithEmailEvent>(_signInWithEmail);
    //on<SignInWithGoogleEvent>(_signInWithGoogle);
    //on<SignUpEvent>(_signUp);
    on<SignOutEvent>(_signOut);
  }

  void _getToken(
    GetTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    final token = await getToken.getToken();
    token.fold(
      (error) => emit(
        AuthenticationFailureState(message: _mapFailureToMessage(error)),
      ),
      (token) {
        if (token != null) {
          emit(AuthenticatedState(token));
        } else {
          emit(UnAuthenticatedState());
        }
      },
    );
  }

  void _signInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final token = await signInWithEmail(
      SignInWithEmailParams(
        userName: event.userName,
        password: event.password,
      ),
    );
    token.fold(
      (error) => emit(
        AuthenticationFailureState(message: _mapFailureToMessage(error)),
      ),
      (token) => emit(AuthenticatedState(token)),
    );
  }

  // void _signInWithGoogle(
  //     SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());
  //   final user = await signInWithGoogle.signInWithGoogle();
  //   user.fold(
  //     (error) => emit(
  //       AuthenticationFailureState(message: _mapFailureToMessage(error)),
  //     ),
  //     (user) => emit(AuthenticatedState(user)),
  //   );
  // }

  // void _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());
  //   final userCredential = await signUp(
  //     SignUpParams(
  //       username: event.username,
  //       email: event.email,
  //       password: event.password,
  //       firstName: event.firstName,
  //       lastName: event.lastName,
  //       type: event.type,
  //     ),
  //   );
  //   await userCredential.fold(
  //     (error) async => emit(
  //       AuthenticationFailureState(message: _mapFailureToMessage(error)),
  //     ),
  //     (token) async => emit(AuthenticatedState(token)),
  //   );
  // }

  void _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final isSignedOut = await signOut.signOut();
    isSignedOut.fold(
      (error) => emit(
        AuthenticationFailureState(message: _mapFailureToMessage(error)),
      ),
      (isSignedOut) {
        if (isSignedOut!) {
          emit(UnAuthenticatedState());
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
