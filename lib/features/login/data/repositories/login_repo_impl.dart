import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/login/domain/data_sources/login_remote_data_source.dart';
import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';
import 'package:twos_home_wear_app/features/login/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failures, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    var either = await loginRemoteDataSource.login(
      email: email,
      password: password,
    );
    return either.fold(
      (failure) => Left(failure),
      (loginEntity) => Right(loginEntity),
    );
  }
}
