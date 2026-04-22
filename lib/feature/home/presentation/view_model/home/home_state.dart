import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/home/domain/entity/home_entity.dart';

class HomeState extends Equatable{
  final StateStatus<HomeEntity>homeStatus;

const HomeState({this.homeStatus=const
StateStatus.initial()});
  HomeState copyWith({
    StateStatus<HomeEntity>?homeStatus
}){
    return HomeState(
      homeStatus: homeStatus??this.homeStatus
    );
}
  @override
  List<Object?> get props => [
    homeStatus
  ];

}