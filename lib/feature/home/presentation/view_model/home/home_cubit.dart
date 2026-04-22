import 'package:flowerecommeric/core/errors/response_exceptions.dart';
import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/home/domain/entity/home_entity.dart';
import 'package:flowerecommeric/feature/home/domain/use_case/get_home_data_use_case.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_intent.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeState>{
  HomeCubit(this._dataUseCase):super(const HomeState());
  final GetHomeDataUseCase _dataUseCase;
  Future<void>doIntent({required HomeIntent intent})async {
    switch(intent){

      case GetHomeData():
       _getHomeData();
    }
  }

  void _getHomeData() async{

    emit(state.copyWith(
        homeStatus: const StateStatus.loading()
    ));
    final result=await _dataUseCase.getHomeData();
    switch(result){

      case SuccessResult<HomeEntity>():
        emit(state.copyWith(
          homeStatus: StateStatus.success(result.data)
        ));
      case FailedResult<HomeEntity>():
        emit(state.copyWith(
            homeStatus: StateStatus.failure(ResponseException(message: result.error))
        ));
    }
  }

}