// Importing necessary packages and modules
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';

// Importing a part file that contains the AppState class definition
part 'app_state.dart';

// AppCubit class which extends Cubit with a state of type AppState
class AppCubit extends Cubit<AppState> {
  // Constructor which accepts a PhraseRepository instance and initializes the state with a new AppState instance
  AppCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const AppState()) {
    // Initializing the stream subscription to listen to changes in the authentication status
    _streamSubscription = _phraseRepository.status.listen(
      updateAuthStatus,
    );
  }

  // Private variables to hold the stream subscription and PhraseRepository instance
  late final StreamSubscription _streamSubscription;
  final PhraseRepository _phraseRepository;

  // Method to update the wallet model in the current state
  void updateWalletModel(WalletModel walletModel) {
    // Emitting a new state with the updated wallet model
    emit(state.copyWith(wallet: walletModel));
  }

  // Method to update the authentication status in the current state
  void updateAuthStatus(AuthStatus status) {
    // Emitting a new state with the updated authentication status
    emit(
      state.copyWith(
        authStatus: status,
      ),
    );
  }

  // Overriding the close method to cancel the stream subscription before closing the cubit
  @override
  Future<void> close() {
    // Canceling the stream subscription to prevent memory leaks
    _streamSubscription.cancel();
    // Closing the cubit
    return super.close();
  }
}
