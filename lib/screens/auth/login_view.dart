import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kalispot/components/default_btn.dart';
import 'package:kalispot/screens/auth/otp_view.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:kalispot/theme/images/appImages.dart';
import 'package:kalispot/widgets/CustomImageView.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/input_withCountry.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isOpen = false;
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _paysDialCodeController = TextEditingController();

  double getCardSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.9
          : (MediaQuery.of(context).size.width * 0.33 + supWidth);

  double getLogoSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 120 : 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepGreen,
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: AppImages.circleLogo,
                fit: BoxFit.contain,
                height: getLogoSize(context),
                width: getLogoSize(context),
              ),
              CustomImageView(
                imagePath: AppImages.verticalLogo,
                fit: BoxFit.contain,
                height: 80,
                margin: const EdgeInsets.all(10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bienvenue",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: "Google Sans",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _buildIntroText(),
              SizedBox(
                width: getCardSize(context),
                child: InputWithcountry(
                    countryDialCodeController: _paysDialCodeController,
                    numberController: _numeroController),
              ),
                SizedBox(
                  width: getCardSize(context),
                  child: DefaultButton(
                    text: "Suivant",
                    backColor: AppColors.easyGreen,
                    textColor: AppColors.deepGreen,
                    press: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const OtpView(),
                        ),
                      );
                    },
                  ),
                ),
            ]),
      ),
    );
  }

  Padding _buildIntroText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: AutoSizeText(
        "Veuillez renseigner vos informations pour vous connecter!",
        maxLines: 2,
        maxFontSize: 32,
        minFontSize: 14,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
          fontFamily: 'Google Sans',
        ),
      ),
    );
  }
}
