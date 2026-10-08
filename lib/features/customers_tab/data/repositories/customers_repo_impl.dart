import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/data_sources/customers_local_data_source.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/data_sources/customers_remote_data_soucre.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/repositories/customers_repo.dart';

@Injectable(as: CustomersRepo)
class CustomersRepoImpl implements CustomersRepo {
  final CustomersRemoteDataSoucre customersRemoteDataSoucre;
  final CustomersLocalDataSource customersLocalDataSource;

  CustomersRepoImpl({
    required this.customersRemoteDataSoucre,
    required this.customersLocalDataSource,
  });
  @override
  Future<Either<Failures, List<CustomerEntity>>> getCustomers({
    String? search,
  }) async {
    await _syncPendingUpdates();
    var either = await customersRemoteDataSoucre.getCustomers(search: search);
    return either.fold(
      (failure) async {
        var localEither = await customersLocalDataSource.getCachedCustomers();
        return localEither.fold((localFailure) => Left(failure), (
          cachedCustomers,
        ) {
          if (search != null && search.trim().isNotEmpty) {
            final filtered = cachedCustomers.where((customer) {
              return (customer.name ?? '').toLowerCase().contains(
                search.toLowerCase(),
              );
            }).toList();
            return Right(filtered);
          }
          return Right(cachedCustomers);
        });
      },
      (customers) async {
        // if user search for customers, not cache search result
        if (search == null || search.trim().isEmpty) {
          await customersLocalDataSource.saveCustomers(customers: customers);
        }
        return Right(customers);
      },
    );
  }

  @override
  Future<Either<Failures, bool>> updateCustomerPhone({
    required int customerId,
    required String phone,
  }) async {
    var either = await customersRemoteDataSoucre.updateCustomerPhone(
      customerId: customerId,
      phone: phone,
    );
    return either.fold(
      (failure) async {
        var localEither = await customersLocalDataSource.updatePhoneLocal(
          customerId: customerId,
          phone: phone,
        );
        return localEither.fold(
          (localFailure) => Left(localFailure),
          (isLocalUpdated) => Right(isLocalUpdated),
        );
      },
      (isUpdated) async {
        await customersLocalDataSource.updatePhoneLocal(
          customerId: customerId,
          phone: phone,
        );
        return Right(isUpdated);
      },
    );
  }

  Future<void> _syncPendingUpdates() async {
    try {
      var pendingBox = await Hive.openBox('pending_phone_updates');
      if (pendingBox.isEmpty) return;
      final updates = Map<dynamic, dynamic>.from(pendingBox.toMap());
      for (var entry in updates.entries) {
        final int customerId = entry.key as int;
        final String phone = entry.value as String;
        var result = await customersRemoteDataSoucre.updateCustomerPhone(
          customerId: customerId,
          phone: phone,
        );
        result.fold((failure) {}, (isSynced) async {
          await pendingBox.delete(customerId);
        });
      }
    } catch (_) {}
  }
}
