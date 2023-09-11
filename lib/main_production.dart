import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/bootstrap.dart';
import 'package:crypto_wallet/data/repositories/repositories.dart';
import 'package:cryptography_flutter/cryptography_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Entry point of the application. The main function is asynchronous to
// allow the necessary components to initialize before launching the application.
Future<void> main() async {
  // Instance creation of the secure storage to safely store sensitive data.
  // Utilizing FlutterSecureStorage to enhance security and confidentiality.
  const storage = FlutterSecureStorage();

  // Initializing the Cryptography library for handling cryptographic operations,
  // a fundamental aspect to secure data handling in the app.
  FlutterCryptography();

  // Loading environment variables from the .env file for secure management
  // of confidential data, a best practice to prevent sensitive data exposure.
  await dotenv.load(fileName: 'assets/.env');

  // The bootstrap function initializes the application with the necessary dependencies,
  // providing repository implementations for the runtime phase of the application,
  // a strategy to ensure solid and reliable application performance.
  await bootstrap(
    () => App(
      phraseRepository: PhraseRepositoryImpl(storage: storage),
      contractRepository: ContractRepositoryImpl(),
    ),
  );
}
