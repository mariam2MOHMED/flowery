import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/feature/home/domain/entity/home_entity.dart';

abstract class HomeRemoteDataSource{
  Future<Result<HomeEntity>>getHomeData();
}