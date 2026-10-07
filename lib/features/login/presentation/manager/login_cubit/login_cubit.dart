import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';
import 'package:twos_home_wear_app/features/login/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    var either = await loginUseCase.call(email: email, password: password);
    either.fold(
      (failure) => emit(LoginError(failures: failure)),
      (loginEntity) => emit(LoginSuccess(loginEntity: loginEntity)),
    );
  }
}
