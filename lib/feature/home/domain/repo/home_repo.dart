import '../../../../core/result/result.dart';
import '../entity/home_entity.dart';

abstract class HomeRepo{
  Future<Result<HomeEntity>> getHomeData();
}