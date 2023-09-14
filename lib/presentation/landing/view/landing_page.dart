import 'package:crypto_wallet/app/app.dart';
import 'package:cs_ui/cs_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/logo.svg',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: context.minBlockVertical * 2.5),
                    Text(
                      'Gyber Wallet',
                      style: CsTextStyle.headline2.copyWith(
                        fontWeight: CsFontWeight.light,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.minBlockVertical * 5),
              SolidButton(
                radius: 10,
                text: 'Create a new Wallet',
                onPressed: () => context.push(WalletPages.seedPhrase),
              ),
              SizedBox(height: context.minBlockVertical * 0.5),
              // NeumorphicButton(
              //     onTap: () {},
              //     borderRadius: 5,
              //     bottomRightShadowBlurRadius: 2,
              //     bottomRightShadowSpreadRadius: 1,
              //     borderWidth: 1,
              //     backgroundColor: CsColors.secondaryButton,
              //     topLeftShadowBlurRadius: 3,
              //     topLeftShadowSpreadRadius: 1,
              //     topLeftShadowColor: CsColors.grey,
              //     bottomRightShadowColor: CsColors.primaryIcon,
              //     height: size.height * 0.08,
              //     width: size.width * 0.9,
              //     padding: const EdgeInsets.all(10),
              //     bottomRightOffset: const Offset(4, 4),
              //     topLeftOffset: const Offset(-4, -4),
              //     child: const Center(child: Text('I already have a wallet')))
              //
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('I already have a wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
