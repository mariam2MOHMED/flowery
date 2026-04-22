import 'package:flowerecommeric/feature/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entity/home_entity.dart';

@injectable
class GetHomeDataUseCase{
  final HomeRepo _homeRepo;
  const GetHomeDataUseCase(this._homeRepo);
  Future<Result<HomeEntity>>getHomeData()async{
    return await _homeRepo.getHomeData();
  }
}