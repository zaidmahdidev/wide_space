// import 'dart:async';
// import 'package:injectable/injectable.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'home_event.dart';
// part 'home_state.dart';
//
// @injectable
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//  IHomeController controller;
//
//   HomeBloc(this.controller) : super(HomeInitial());
//
//   @override
//   Stream<HomeState> mapEventToState(
//     HomeEvent event,
//   ) async* {
//     if(event is HomeFetchEvent){
//         yield HomeFetchingState();
//         final response = await controller.getHome();
//             if (response.ok) {
//                yield HomeFetchingSuccessState(response.response);
//                return;
//               }
//         yield HomeFetchingFailureState(response.message);
//     }
//     else if (event is HomePostEvent){
//          yield HomePostingState();
//            final response = await controller.getHome();
//              if (response.ok) {
//                 yield HomePostingSuccessState(response.response);
//                     return;
//              }
//          yield HomePostingFailureState(response.message);
//     }
//   }
// }
