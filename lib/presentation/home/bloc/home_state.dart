part of 'home_bloc.dart';

// The HomeState class is used to represent the state of the HomeBloc.
// It extends the Equatable class, which allows us to compare different instances of HomeState
// to efficiently determine whether the state has changed.
class HomeState extends Equatable {
  // Constructor for creating a new instance of HomeState,
  // which can optionally take an EtherAmount to initialize the ethBalance property.
  const HomeState({this.ethBalance});

  // A copyWith method that helps in copying an instance of HomeState
  // while changing only specific properties.
  HomeState copyWith({
    EtherAmount? ethBalance,
  }) {
    return HomeState(
      // If no new value is provided, the existing value of ethBalance is retained.
      ethBalance: ethBalance ?? this.ethBalance,
    );
  }

  // The ethBalance property represents the current Ethereum balance,
  // which is optionally set (may be null).
  final EtherAmount? ethBalance;

  // The props method is overridden to provide a list of properties
  // that should be considered when comparing different instances of HomeState.
  @override
  List<Object?> get props => [ethBalance];
}
