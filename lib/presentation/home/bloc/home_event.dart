part of 'home_bloc.dart';

// Abstract class representing the base for all HomeEvents.
// It extends Equatable to allow for comparison between instances of HomeEvent.
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// Concrete event representing the request to get the Ethereum balance associated with a public key.
// It extends HomeEvent, thus must define a list of properties that will be used for comparison
// (in this case, the public key).
class GetEthBalanceEvent extends HomeEvent {
  const GetEthBalanceEvent(this.publicKey);

  final String publicKey;

  @override
  List<Object> get props => [publicKey];
}
