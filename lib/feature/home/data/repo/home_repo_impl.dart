import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/feature/home/data/data_source/home_data_source.dart';
import 'package:flowerecommeric/feature/home/domain/entity/home_entity.dart';
import 'package:flowerecommeric/feature/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  final HomeRemoteDataSource _remoteDataSource;
  const HomeRepoImpl(this._remoteDataSource);
  @override
  Future<Result<HomeEntity>> getHomeData()async{
return await _remoteDataSource.getHomeData();
  }

}