import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:dotted_border/dotted_border.dart';

import '../cubit/import_wallet_state.dart';
import '../cubit/import_wallet_cubit.dart';

class ImportWalletPage extends StatelessWidget {
  // Instantiate the ImportWalletCubit which will manage the state
  final ImportWalletCubit _cubit = ImportWalletCubit();

  final TextEditingController seedPhraseController = TextEditingController();

  ImportWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Import Wallet'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<ImportWalletCubit, ImportWalletState>(
              listener: (context, state) {
                // Displaying a message when an error occurs
                if (state.errorText.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorText)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter seed phrase to import wallet:',
                      style: TextStyle(color: CsColors.white, fontSize: 18.0),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    _buildSeedPhraseInput(context),
                    const SizedBox(height: 16.0),
                    _buildButton(context, state),
                    if (state.importSuccess)
                      const Text(
                        'Wallet Imported Successfully!',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.green,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Builds the seed phrase input field with validation
  Widget _buildSeedPhraseInput(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [10, 5],
      color: CsColors.danger.withOpacity(0.4),
      radius: const Radius.circular(10),
      child: TextField(
        controller: seedPhraseController,
        style: const TextStyle(color: CsColors.secondaryIcon),
        decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(backgroundColor: CsColors.danger),
          labelStyle: TextStyle(color: CsColors.white),
          labelText: 'Seed Phrase',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: CsColors.danger,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }

  // Builds the appropriate button based on the current state
  Widget _buildButton(BuildContext context, ImportWalletState state) {
    if (state.isImporting) {
      return const CircularProgressIndicator();
    } else {
      return ElevatedButton(
        onPressed: () => _cubit.importWallet(seedPhraseController.text),
        child: const Text('Import'),
      );
    }
  }
}
