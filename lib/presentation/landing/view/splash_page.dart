// Importing the necessary packages and modules
import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:crypto_wallet/presentation/authentication/landing/landing.dart';
import 'package:crypto_wallet/presentation/landing/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// A StatelessWidget that represents the splash page of the application
class SplashPage extends StatelessWidget {
  // Constructor which accepts a key as an optional parameter
  const SplashPage({Key? key}) : super(key: key);

  // The build method which gets called to draw the widget onto the screen
  @override
  Widget build(BuildContext context) {
    // Using BlocBuilder to rebuild the widget based on AppState changes
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        // If the user is authenticated, navigate to the authenticated landing page
        if (state.authStatus == AuthStatus.authenticated) {
          return const AuthLandingPage();
        }
        // If the user is unauthenticated or in any other state, navigate to the unauthenticated landing page
        else if (state.authStatus == AuthStatus.unauthenticated) {
          return const LandingPage();
        }
        // Fallback to unauthenticated landing page in case of any other states
        else {
          return const LandingPage();
        }
      },
    );
  }
}
