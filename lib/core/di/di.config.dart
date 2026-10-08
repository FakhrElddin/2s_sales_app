// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/customers_tab/data/data_sources/customers_local_data_source_impl.dart'
    as _i869;
import '../../features/customers_tab/data/data_sources/customers_remote_data_source_impl.dart'
    as _i194;
import '../../features/customers_tab/data/repositories/customers_repo_impl.dart'
    as _i822;
import '../../features/customers_tab/domain/data_sources/customers_local_data_source.dart'
    as _i777;
import '../../features/customers_tab/domain/data_sources/customers_remote_data_soucre.dart'
    as _i128;
import '../../features/customers_tab/domain/repositories/customers_repo.dart'
    as _i1020;
import '../../features/customers_tab/domain/use_cases/get_customers_use_case.dart'
    as _i10;
import '../../features/customers_tab/domain/use_cases/update_customer_phone_use_case.dart'
    as _i545;
import '../../features/customers_tab/presentation/manager/customers_cubit/customers_cubit.dart'
    as _i227;
import '../../features/login/data/data_sources/login_remote_data_source_impl.dart'
    as _i321;
import '../../features/login/data/repositories/login_repo_impl.dart' as _i546;
import '../../features/login/domain/data_sources/login_remote_data_source.dart'
    as _i362;
import '../../features/login/domain/repositories/login_repo.dart' as _i1061;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i994;
import '../../features/sales_tab/data/data_sources/sales_local_data_source_impl.dart'
    as _i234;
import '../../features/sales_tab/data/data_sources/sales_orders_remote_data_source_impl.dart'
    as _i520;
import '../../features/sales_tab/data/repositories/sales_orders_repo_impl.dart'
    as _i146;
import '../../features/sales_tab/domain/data_sources/sales_local_data_source.dart'
    as _i243;
import '../../features/sales_tab/domain/data_sources/sales_orders_remote_data_source.dart'
    as _i586;
import '../../features/sales_tab/domain/repositories/sales_orders_repo.dart'
    as _i604;
import '../../features/sales_tab/domain/use_cases/confirm_order_use_case.dart'
    as _i498;
import '../../features/sales_tab/domain/use_cases/get_order_details_use_case.dart'
    as _i794;
import '../../features/sales_tab/domain/use_cases/get_sales_orders_use_case.dart'
    as _i600;
import '../../features/sales_tab/presentation/manager/order_details_cubit/order_details_cubit.dart'
    as _i637;
import '../../features/sales_tab/presentation/manager/sales_orders_cubit/sales_orders_cubit.dart'
    as _i307;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i777.CustomersLocalDataSource>(
        () => _i869.CustomersLocalDataSourceImpl());
    gh.factory<_i362.LoginRemoteDataSource>(() =>
        _i321.LoginRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i128.CustomersRemoteDataSoucre>(() =>
        _i194.CustomersRemoteDataSourceImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i1020.CustomersRepo>(() => _i822.CustomersRepoImpl(
          customersRemoteDataSoucre: gh<_i128.CustomersRemoteDataSoucre>(),
          customersLocalDataSource: gh<_i777.CustomersLocalDataSource>(),
        ));
    gh.factory<_i1061.LoginRepo>(() => _i546.LoginRepoImpl(
        loginRemoteDataSource: gh<_i362.LoginRemoteDataSource>()));
    gh.factory<_i586.SalesOrdersRemoteDataSource>(() =>
        _i520.SalesOrdersRemoteDataSourceImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i243.SalesLocalDataSource>(
        () => _i234.SalesLocalDataSourceImpl());
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(loginRepo: gh<_i1061.LoginRepo>()));
    gh.factory<_i604.SalesOrdersRepo>(() => _i146.SalesOrdersRepoImpl(
          salesOrdersRemoteDataSource: gh<_i586.SalesOrdersRemoteDataSource>(),
          salesLocalDataSource: gh<_i243.SalesLocalDataSource>(),
        ));
    gh.factory<_i994.LoginCubit>(
        () => _i994.LoginCubit(loginUseCase: gh<_i191.LoginUseCase>()));
    gh.factory<_i10.GetCustomersUseCase>(() =>
        _i10.GetCustomersUseCase(customersRepo: gh<_i1020.CustomersRepo>()));
    gh.factory<_i545.UpdateCustomerPhoneUseCase>(() =>
        _i545.UpdateCustomerPhoneUseCase(
            customersRepo: gh<_i1020.CustomersRepo>()));
    gh.factory<_i498.ConfirmOrderUseCase>(() => _i498.ConfirmOrderUseCase(
        salesOrdersRepo: gh<_i604.SalesOrdersRepo>()));
    gh.factory<_i794.GetOrderDetailsUseCase>(() => _i794.GetOrderDetailsUseCase(
        salesOrdersRepo: gh<_i604.SalesOrdersRepo>()));
    gh.factory<_i600.GetSalesOrdersUseCase>(() => _i600.GetSalesOrdersUseCase(
        salesOrdersRepo: gh<_i604.SalesOrdersRepo>()));
    gh.factory<_i307.SalesOrdersCubit>(() => _i307.SalesOrdersCubit(
        getSalesOrdersUseCase: gh<_i600.GetSalesOrdersUseCase>()));
    gh.factory<_i637.OrderDetailsCubit>(() => _i637.OrderDetailsCubit(
          getOrderDetailsUseCase: gh<_i794.GetOrderDetailsUseCase>(),
          confirmOrderUseCase: gh<_i498.ConfirmOrderUseCase>(),
        ));
    gh.factory<_i227.CustomersCubit>(() => _i227.CustomersCubit(
          getCustomersUseCase: gh<_i10.GetCustomersUseCase>(),
          updateCustomerPhoneUseCase: gh<_i545.UpdateCustomerPhoneUseCase>(),
        ));
    return this;
  }
}
