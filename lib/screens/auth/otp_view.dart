import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kalispot/components/default_btn.dart';
import 'package:kalispot/screens/auth/complete_profil_view.dart';
import 'package:kalispot/screens/auth/components/filled_rounded_pin_put.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:kalispot/theme/images/appImages.dart';
import 'package:kalispot/widgets/CustomImageView.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/input_withCountry.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  bool isOpen = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();

  double getCardSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.95
          : (MediaQuery.of(context).size.width * 0.4 + supWidth);

  double getBtnWidth(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.8
          : (MediaQuery.of(context).size.width * 0.33 + supWidth);

  double getLogoSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 120 : 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColors.deepGreen,
        body: Center(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: getCardSize(context),
                child: Card(
                  color: AppColors.easyGreen.withOpacity(0.2),
                  elevation: 0.0,
                  shadowColor: AppColors.deepGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.easyGreen.withOpacity(0.4)),
                        child: const Icon(Icons.mail,
                            color: AppColors.easyGreen, size: 35),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     "OTP",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .headlineMedium!
                      //         .copyWith(
                      //             fontFamily: "Google Sans",
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     "Vérification OTP",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyLarge!
                      //         .copyWith(
                      //             fontFamily: "Google Sans",
                      //             color: Colors.white70,
                      //             fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      _buildIntroText(),
                      const SizedBox(height: 15),
                      //********************************************** */
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: FilledRoundedPinPut(
                              codeController: codeController),
                        ),
                      ),
                      _buildSubText(),
                      //********************************************** */
                      SizedBox(
                        width: getBtnWidth(context),
                        child: DefaultButton(
                          text: "Confirmer",
                          backColor: AppColors.easyGreen,
                          textColor: AppColors.deepGreen,
                          press: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const CompleteProfilView(),
                              ),
                            );
                          },
                        ),
                      ),
                      //********************************************** */
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Je n'ai pas reçu le code! ",
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontSize: 13),
                            children: [
                              TextSpan(
                                  text: ' Réenvoyer le code ',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.easyOrange,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildIntroText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: AutoSizeText(
        "Un Code OTP vous a été envoyé par SMS",
        maxLines: 2,
        presetFontSizes: [18, 15, 13],
        textAlign: TextAlign.center,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(.9),
          fontFamily: 'Google Sans',
        ),
      ),
    );
  }

  Padding _buildSubText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: AutoSizeText(
        "Veuillez saisir le code envoyé sur votre numéro de téléphone",
        maxLines: 2,
        presetFontSizes: [15, 13],
        textAlign: TextAlign.center,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(.9),
          fontFamily: 'Google Sans',
        ),
      ),
    );
  }
}
