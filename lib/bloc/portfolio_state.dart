// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class GetPortfolioLoadingState extends PortfolioState {}

class GetPortfolioLoadedState extends PortfolioState {
  final PortfolioModel portfolio;
  const GetPortfolioLoadedState({
    required this.portfolio,
  });
}

class GetPortfolioErrorState extends PortfolioState {
  final String message;
  const GetPortfolioErrorState({
    required this.message,
  });
}
