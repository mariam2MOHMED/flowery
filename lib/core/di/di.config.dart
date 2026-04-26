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
import '../../feature/cart/api/client/cart_client.dart' as _i748;
import '../../feature/cart/api/data_source/cart_data_source_impl.dart' as _i605;
import '../../feature/cart/data/data_source/cart_data_source.dart' as _i473;
import '../../feature/cart/data/repo/cart_repo_impl.dart' as _i1024;
import '../../feature/cart/domain/repo/cart_repo.dart' as _i131;
import '../../feature/cart/domain/use_case/add_to_cart_use_case.dart' as _i1016;
import '../../feature/cart/domain/use_case/delete_cart_item_use_case.dart'
    as _i256;
import '../../feature/cart/domain/use_case/get_all_cart_items_use_case.dart'
    as _i729;
import '../../feature/cart/domain/use_case/update_cart_quantity_use_case.dart'
    as _i397;
import '../../feature/cart/presentation/view_model/cart_cubit.dart' as _i683;
import '../../feature/home/api/client/home_api_services.dart' as _i397;
import '../../feature/home/api/data_source/home_data_source_impl.dart' as _i145;
import '../../feature/home/data/data_source/home_data_source.dart' as _i130;
import '../../feature/home/data/repo/home_repo_impl.dart' as _i909;
import '../../feature/home/domain/repo/home_repo.dart' as _i518;
import '../../feature/home/domain/use_case/get_home_data_use_case.dart'
    as _i422;
import '../../feature/home/presentation/view_model/home/home_cubit.dart'
    as _i244;
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
    gh.factory<_i748.CartClientServices>(
      () => _i748.CartClientServices(gh<_i361.Dio>()),
    );
    gh.factory<_i397.HomeClient>(() => _i397.HomeClient(gh<_i361.Dio>()));
    gh.factory<_i868.AuthRemoteDataSource>(
      () => _i27.AuthRemoteDataSourceImpl(gh<_i199.AuthApiServices>()),
    );
    gh.factory<_i130.HomeRemoteDataSource>(
      () => _i145.HomeRemoteDataSourceImpl(gh<_i397.HomeClient>()),
    );
    gh.factory<_i473.CartDataSource>(
      () => _i605.CartDataSourceImpl(gh<_i748.CartClientServices>()),
    );
    gh.factory<_i131.CartRepo>(
      () => _i1024.CartRepoImpl(gh<_i473.CartDataSource>()),
    );
    gh.factory<_i518.HomeRepo>(
      () => _i909.HomeRepoImpl(gh<_i130.HomeRemoteDataSource>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i577.AuthRepoImpl(gh<_i868.AuthRemoteDataSource>()),
    );
    gh.factory<_i1016.AddToCartUseCase>(
      () => _i1016.AddToCartUseCase(gh<_i131.CartRepo>()),
    );
    gh.factory<_i256.DeleteCartItemUseCase>(
      () => _i256.DeleteCartItemUseCase(gh<_i131.CartRepo>()),
    );
    gh.factory<_i729.GetAllCartItemsUseCase>(
      () => _i729.GetAllCartItemsUseCase(gh<_i131.CartRepo>()),
    );
    gh.factory<_i397.UpdateCartQuantityUseCase>(
      () => _i397.UpdateCartQuantityUseCase(gh<_i131.CartRepo>()),
    );
    gh.factory<_i422.GetHomeDataUseCase>(
      () => _i422.GetHomeDataUseCase(gh<_i518.HomeRepo>()),
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
    gh.factory<_i683.CartCubit>(
      () => _i683.CartCubit(
        gh<_i1016.AddToCartUseCase>(),
        gh<_i397.UpdateCartQuantityUseCase>(),
        gh<_i256.DeleteCartItemUseCase>(),
        gh<_i729.GetAllCartItemsUseCase>(),
      ),
    );
    gh.factory<_i244.HomeCubit>(
      () => _i244.HomeCubit(gh<_i422.GetHomeDataUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i890.SharedPrefModule {}

class _$DioModule extends _i916.DioModule {}
