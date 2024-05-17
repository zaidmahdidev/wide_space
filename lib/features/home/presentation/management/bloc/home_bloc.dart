import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:student_portal_app/core/errors/failures.dart';
import 'package:student_portal_app/core/network/local/cache_helper.dart';
import 'package:student_portal_app/features/home/data/home_model.dart';
import 'package:student_portal_app/features/home/data/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeEvent>((_onHomeEvent));
  }

  void _onHomeEvent(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetHomeDataEvent) {
      emit(HomeLoadingDataState());
      final failureOrData = await homeRepository.homeData(
        token: event.token,
      );
      failureOrData.fold(
        (failure) {
          emit(HomeErrorDataState(error: mapFailureToMessage(failure)));
        },
        (data) {
          emit(HomeSuccessDataState(homeModel: data));
        },
      );
    }
    if(event is ChangModeEvent){
      emit(HomeLoadingDataState());
      homeRepository.changMode();
      emit(ChangeModeState());
    }
  }
}
