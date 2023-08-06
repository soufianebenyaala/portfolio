import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/model/portfolio_model.dart';
import 'package:portfolio/util/shared_prefes_manager.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioInitial()) {
    on<PortfolioEvent>((event, emit) async {
      if (event is GetPortfolioEvent) {
        emit(GetPortfolioLoadingState());
        try {
          String jsonString = await rootBundle.loadString(
              'assets/data_${SharedPrefsManager.getLanguage()}.json');
          emit(GetPortfolioLoadedState(
              portfolio: PortfolioModel.fromJson(jsonString)));
        } catch (e) {
          emit(const GetPortfolioErrorState(
              message:
                  "An unexpected error occurred. Please try again later."));
        }
      }
    });
  }
}
