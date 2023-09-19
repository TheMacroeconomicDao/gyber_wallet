import 'package:bloc/bloc.dart';
import 'import_wallet_state.dart';

class ImportWalletCubit extends Cubit<ImportWalletState> {
  ImportWalletCubit() : super(ImportWalletState());

  // This method initializes the importing process by setting the isImporting flag to true
  void initializeImport() {
    emit(state.copyWith(isImporting: true));
  }

  // This method finalizes the importing process and sets the necessary flags based on the success parameter
  void finalizeImport(bool success, [String errorText = '']) {
    emit(state.copyWith(isImporting: false, importSuccess: success, errorText: errorText));
  }

  // This method handles the import wallet logic, including error handling
  void importWallet(String seedPhrase) {
    if (seedPhrase.isEmpty) {
      emit(state.copyWith(errorText: 'Please enter a seed phrase'));
      return;
    }

    initializeImport();

    // Simulate a delay to represent real wallet importing logic
    Future.delayed(Duration(seconds: 2), () {
      finalizeImport(true);
    });
  }
}
