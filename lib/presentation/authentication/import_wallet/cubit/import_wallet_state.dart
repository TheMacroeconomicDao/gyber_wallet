class ImportWalletState {
  final bool isImporting; // Indicates if the wallet is currently being imported
  final bool importSuccess; // Indicates if the wallet was imported successfully
  final String errorText; // Holds any error message that needs to be displayed

  ImportWalletState({
    this.isImporting = false,
    this.importSuccess = false,
    this.errorText = '',
  });

  // Method to create a new state based on the existing state
  ImportWalletState copyWith({
    bool? isImporting,
    bool? importSuccess,
    String? errorText,
  }) {
    return ImportWalletState(
      isImporting: isImporting ?? this.isImporting,
      importSuccess: importSuccess ?? this.importSuccess,
      errorText: errorText ?? this.errorText,
    );
  }
}
