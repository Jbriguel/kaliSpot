import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalispot/components/default_btn.dart';
import 'package:kalispot/functions/openCalendar.dart';
import 'package:kalispot/screens/auth/components/filled_rounded_pin_put.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:kalispot/theme/images/appImages.dart';
import 'package:kalispot/widgets/CustomImageView.dart';
import 'package:kalispot/widgets/inputField.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../home/home_view.dart';
import 'components/input_withCountry.dart';

class CompleteProfilView extends StatefulWidget {
  const CompleteProfilView({super.key});

  @override
  State<CompleteProfilView> createState() => _CompleteProfilViewState();
}

class _CompleteProfilViewState extends State<CompleteProfilView> {
  bool isOpen = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController nomController = TextEditingController();
  TextEditingController preNomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  double getCardSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.9
          : (MediaQuery.of(context).size.width * 0.35 + supWidth);

  double getCardImageSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.9
          : (MediaQuery.of(context).size.width * 0.3 + supWidth);

  double getBtnWidth(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.8
          : (MediaQuery.of(context).size.width * 0.33 + supWidth);

  double getLogoSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 120 : 150;

  double getCardHeight(BuildContext context) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 300 : 400;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColors.deepGreen,
        // appBar: ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
        //     ? null
        //     : SmallAppBar(),
        body: Stack(
          children: [
            CustomImageView(
              imagePath: AppImages.iaBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: ResponsiveRowColumn(
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      rowCrossAxisAlignment: CrossAxisAlignment.center,
                      columnCrossAxisAlignment: CrossAxisAlignment.center,
                      columnMainAxisSize: MainAxisSize.min,
                      columnMainAxisAlignment: MainAxisAlignment.center,
                      rowMainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // if (ResponsiveBreakpoints.of(context)
                        //     .largerThan("MOBILE_LARGE")) ...[
                        //   ResponsiveRowColumnItem(
                        //     child: Container(
                        //       color: Colors.grey.shade900,
                        //       height: getCardHeight(context),
                        //       width: getCardImageSize(context),
                        //       child: CustomImageView(
                        //         imagePath: AppImages.iaBackground,
                        //         fit: BoxFit.cover,
                        //         width: double.infinity,
                        //         height: double.infinity,
                        //       ),
                        //     ),
                        //   )
                        // ],
                        ResponsiveRowColumnItem(
                          child: Container(
                            // height: getCardHeight(context),
                            width: getCardSize(context),
                            decoration: BoxDecoration(
                                color: ResponsiveBreakpoints.of(context)
                                        .largerThan("MOBILE_LARGE")
                                    ? Colors.black45
                                    :  AppColors.easyGreen.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.easyGreen
                                            .withOpacity(0.4)),
                                    child: const Icon(LineAwesomeIcons.user,
                                        color: AppColors.easyGreen, size: 35),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(5),
                                  //   child: CustomImageView(
                                  //     imagePath: AppImages.verticalLogo,
                                  //     fit: BoxFit.contain,
                                  //     height: 80,
                                  //   ),
                                  // ),
                                  _buildIntroText(),
                                  // _buildSubText(),
                                  const SizedBox(height: 15),
                                  resizeMe(
                                    CustomTextFormField(
                                      suffix: const Icon(
                                        LineAwesomeIcons.user,
                                        color: AppColors.easyGreen,
                                      ),
                                      controller: nomController,
                                      hintText: "Votre Nom",
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      autofocus: false,
                                      fillColor:
                                          ResponsiveBreakpoints.of(context)
                                                  .largerThan("MOBILE_LARGE")
                                              ? Colors.white10.withOpacity(0.1)
                                              : Colors.black12
                                                  .withOpacity(0.19),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  resizeMe(
                                    CustomTextFormField(
                                      suffix: const Icon(
                                        LineAwesomeIcons.user,
                                        color: AppColors.easyGreen,
                                      ),
                                      controller: preNomController,
                                      hintText: "Prénom(s)",
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      autofocus: false,
                                      fillColor:
                                          ResponsiveBreakpoints.of(context)
                                                  .largerThan("MOBILE_LARGE")
                                              ? Colors.white10.withOpacity(0.1)
                                              : Colors.black12
                                                  .withOpacity(0.19),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  resizeMe(
                                    CustomTextFormField(
                                      suffix: const Icon(
                                        Icons.mail,
                                        color: AppColors.easyGreen,
                                      ),
                                      controller: emailController,
                                      hintText: "Email",
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      autofocus: false,
                                      fillColor:
                                          ResponsiveBreakpoints.of(context)
                                                  .largerThan("MOBILE_LARGE")
                                              ? Colors.white10.withOpacity(0.1)
                                              : Colors.black12
                                                  .withOpacity(0.19),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  resizeMe(
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? dateTime = await openCalendar(
                                            context,
                                            helpText:
                                                'Choisir date de fin de prise');
                                        if (dateTime != null) {
                                          birthController.value =
                                              TextEditingValue(
                                            text: DateFormat('dd-MM-yyyy')
                                                .format(dateTime),
                                          );
                                        }
                                      },
                                      child: CustomTextFormField(
                                        suffix: const Icon(
                                          Icons.calendar_month_outlined,
                                          color: AppColors.easyGreen,
                                        ),
                                        enable: false,
                                        controller: birthController,
                                        hintText: "Date de naissance",
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.text,
                                        autofocus: false,
                                        fillColor: ResponsiveBreakpoints.of(
                                                    context)
                                                .largerThan("MOBILE_LARGE")
                                            ? Colors.white10.withOpacity(0.1)
                                            : Colors.black12.withOpacity(0.19),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  resizeMe(DefaultButton(
                                    text: "SUIVANT",
                                    press: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              HomeView(),
                                        ),
                                      );
                                    },
                                    textColor: AppColors.deepGreen,
                                    backColor: AppColors.easyGreen,
                                  )),
                                  const SizedBox(height: 15),
                                ]),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget resizeMe(Widget child) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
          width: ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
              ? constraints.maxWidth * 0.8
              : constraints.maxWidth * 0.95,
          child: child);
    });
  }

  Padding _buildIntroText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: AutoSizeText(
        "Veuillez saisir vos informations personnelles",
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
        "Renseignez ses informations afin de continuer",
        maxLines: 2,
        presetFontSizes: [14, 13],
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

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  SmallAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.deepGreen,
      leading: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: CustomImageView(
              imagePath: AppImages.verticalLogo,
              fit: BoxFit.contain,
              height: 50,
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Complete Profil",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
      ),
      actions: [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70);
}
