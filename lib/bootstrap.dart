// Importing necessary libraries
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

// AppBlocObserver class serves to monitor changes and errors within the app's BLoC instances
class AppBlocObserver extends BlocObserver {
  // This method is triggered every time there's a state change in any BLoC
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)'); // Log the information regarding the change
  }

  // This method is triggered whenever there's an error in any BLoC
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)'); // Log the error information
    super.onError(bloc, error, stackTrace);
  }
}

// Main function to bootstrap the application
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Setting the Flutter error handler
  FlutterError.onError = (details) {
    log(details.exceptionAsString(),
        stackTrace: details.stack); // Log the Flutter error details
  };

  // Setting the BLoC observer
  Bloc.observer = AppBlocObserver();

  // Running the app with the provided Widget
  runApp(await builder());
}
