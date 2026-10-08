import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';
import 'package:twos_home_wear_app/features/login/domain/repositories/login_repo.dart';

@injectable
class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failures, LoginEntity>> call({
    required String email,
    required String password,
  }) {
    return loginRepo.login(email: email, password: password);
  }
}
