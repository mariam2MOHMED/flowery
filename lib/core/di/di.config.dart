// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/auth/api/client/auth_api_services.dart' as _i199;
import '../../feature/auth/api/data_source_impl/auth_data_source_impl.dart'
    as _i27;
import '../../feature/auth/data/data_source/auth_data_source.dart' as _i868;
import '../../feature/auth/data/repo/auth_repo.dart' as _i976;
import '../../feature/auth/domain/repo/auth_repo_impl.dart' as _i577;
import '../../feature/auth/domain/use_case/login_use_case.dart' as _i433;
import '../../feature/auth/domain/use_case/register_use_case.dart' as _i313;
import '../../feature/auth/presentation/view_model/login/login_cubit.dart'
    as _i21;
import '../../feature/auth/presentation/view_model/register/register_cubit.dart'
    as _i987;
import '../interceptor/token_interecptor.dart' as _i931;
import '../local_storage/secure_storage.dart' as _i146;
import 'modules/dio.dart' as _i916;
import 'modules/shared_preference_module.dart' as _i890;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefModule = _$SharedPrefModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.provideSharedPref(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.providePrettyDio());
    gh.lazySingleton<_i146.SecureStorageService>(
      () => _i146.SecureStorageService(),
    );
    gh.lazySingleton<_i931.TokenInterecptor>(
      () => _i931.TokenInterecptor(gh<_i146.SecureStorageService>()),
    );
    gh.factory<_i199.AuthApiServices>(
      () => _i199.AuthApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i868.AuthRemoteDataSource>(
      () => _i27.AuthRemoteDataSourceImpl(gh<_i199.AuthApiServices>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i577.AuthRepoImpl(gh<_i868.AuthRemoteDataSource>()),
    );
    gh.factory<_i433.LoginUseCase>(
      () => _i433.LoginUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i313.RegisterUseCase>(
      () => _i313.RegisterUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i21.LoginCubit>(
      () => _i21.LoginCubit(
        gh<_i433.LoginUseCase>(),
        gh<_i146.SecureStorageService>(),
      ),
    );
    gh.factory<_i987.RegisterCubit>(
      () => _i987.RegisterCubit(gh<_i313.RegisterUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i890.SharedPrefModule {}

class _$DioModule extends _i916.DioModule {}
