import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failures, LoginEntity>> login({
    required String email,
    required String passwrod,
  });
}
