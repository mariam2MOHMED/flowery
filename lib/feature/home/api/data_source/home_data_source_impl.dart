import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/safe_api_call/safe_api_call.dart';
import 'package:flowerecommeric/feature/home/domain/entity/home_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/home_data_source.dart';
import '../client/home_api_services.dart';
@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements
    HomeRemoteDataSource{
 final HomeClient _homeClient;
 const HomeRemoteDataSourceImpl(this._homeClient);
  @override
  Future<Result<HomeEntity>> getHomeData() {

  return safeApiCall(()async{
    final home=await _homeClient.getHome();
    return home.toEntity();
  });
  }

}