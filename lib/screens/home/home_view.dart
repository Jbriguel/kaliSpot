import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kalispot/components/default_btn.dart';
import 'package:kalispot/screens/auth/components/filled_rounded_pin_put.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:kalispot/theme/images/appImages.dart';
import 'package:kalispot/widgets/CustomImageView.dart';
import 'package:kalispot/widgets/inputField.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/recordIcon.dart';
import 'components/topInfos.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isMenuExpanded = true;

  bool isOpen = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  double getBtnRowSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.9
          : (MediaQuery.of(context).size.width * 0.6 + supWidth);

  double getCardImageSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.9
          : (MediaQuery.of(context).size.width * 0.3 + supWidth);

  double getCardWidth(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
          ? MediaQuery.of(context).size.width * 0.8
          : (MediaQuery.of(context).size.width * 0.5 + supWidth);

  double getLogoSize(BuildContext context, {double supWidth = 0.0}) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 130 : 120;

  double getCardHeight(BuildContext context) =>
      !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 300 : 400;

  bool recordMode = true;

  @override
  Widget build(BuildContext context) {
    double smallHeight = 80;
    double headerMinHeight = MediaQuery.of(context).size.height * 0.7;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth > 800;

        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: AppColors.deepGreen,
              appBar:
                  ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
                      ? largeAppBar(
                          smallHeight: smallHeight,
                          openDrawer: () {
                            setState(() {
                              isMenuExpanded = !isMenuExpanded;
                            });
                          },
                        )
                      : SmallAppBar(drawerKey: _key),
              key: _scaffoldKey,
              drawer: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isMenuExpanded ? 250 : 60,
                color: Colors.black45,
                child: Column(
                  children: [
                    Expanded(child: DrawerMenu()),
                  ],
                ),
              ),
              body: Row(
                children: [
                  if (isLargeScreen)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isMenuExpanded ? 250 : 60,
                      color: Colors.black45,
                      child: Column(
                        children: [
                          //   IconButton(
                          //     icon: Icon(
                          //         isMenuExpanded ? Icons.menu_open : Icons.menu,
                          //         color: Colors.white),
                          //     onPressed: () {
                          //       setState(() {
                          //         isMenuExpanded = !isMenuExpanded;
                          //       });
                          //     },
                          //   ),
                          Expanded(child: DrawerMenu()),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: getCardWidth(context),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.19),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black38),
                                  child: const Icon(LineAwesomeIcons.user,
                                      color: AppColors.easyGreen, size: 24),
                                ),
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Saîdou Kanté",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color:
                                                  Colors.white.withOpacity(.9),
                                              fontFamily: 'Google Sans',
                                            ),
                                      ),
                                      Text(
                                        "(+223) 77 51 20 19",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Colors.white70,
                                              fontFamily: 'Google Sans',
                                            ),
                                      ),
                                    ]),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black38),
                                  child: CustomImageView(
                                    imagePath: AppImages.bulb,
                                    fit: BoxFit.contain,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ]),
                        ),
                        if (!recordMode) ...[
                          // Expanded(
                          //   child: ChatMessages(),
                          // ),
                          Spacer(),
                          ChatInputField(changeMode: () {
                            setState(() {
                              recordMode = !recordMode;
                            });
                          })
                        ] else ...[
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.easyGreen,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Kadija",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.deepGreen,
                                              fontFamily: "Google Sans",
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 5,
                                          color: AppColors.easyGreen,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Online",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: Colors.white70,
                                                  fontFamily: "Google Sans"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: AppImages.circleLogo,
                                    fit: BoxFit.contain,
                                    height: getLogoSize(context),
                                    width: getLogoSize(context),
                                    margin: const EdgeInsets.all(8.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Hi Saïdou, \n How can i help you Today ?",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontFamily: "Google Sans",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: getBtnRowSize(context),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                recordMode = !recordMode;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.violet),
                                              child: const Icon(
                                                  LineAwesomeIcons.keyboard,
                                                  color: Colors.white,
                                                  size: 25),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Recordicon(
                                            plusWidth: ResponsiveBreakpoints.of(
                                                        context)
                                                    .largerThan("MOBILE_LARGE")
                                                ? 10
                                                : 30,
                                            press: () {},
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                recordMode = !recordMode;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.white10),
                                                  color: Colors.grey.shade800),
                                              child: const Icon(
                                                  Icons.clear_rounded,
                                                  color: Colors.white60,
                                                  size: 25),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(width: 10),
                                ]),
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // DrawerHeader(
        //   child:
        //       Text('Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
        //   decoration: BoxDecoration(color: Colors.blueGrey.shade700),
        // ),
        // ListTile(
        //   leading: Icon(Icons.home, color: Colors.white),
        //   title: Text('Home', style: TextStyle(color: Colors.white)),
        //   onTap: () {},
        // ),
        // ListTile(
        //   leading: Icon(Icons.settings, color: Colors.white),
        //   title: Text('Settings', style: TextStyle(color: Colors.white)),
        //   onTap: () {},
        // ),
      ],
    );
  }
}

class ChatMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Message 1')),
        ListTile(title: Text('Message 2')),
        ListTile(title: Text('Message 3')),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  ChatInputField({required this.changeMode});

  VoidCallback changeMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              isLabel: false,
              prefix: const Icon(
                Icons.search,
                color: AppColors.easyGreen,
              ),
              suffix: GestureDetector(
                onTap: changeMode,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black38),
                  child: const Icon(LineAwesomeIcons.microphone_solid,
                      color: AppColors.easyGreen, size: 24),
                ),
              ),
              hintText: "Poser votre question",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              autofocus: false,
              fillColor:
                  ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
                      ? Colors.white10.withOpacity(0.1)
                      : Colors.white10.withOpacity(0.1),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.easyGreen),
            child: IconButton(
              icon: Icon(
                LineAwesomeIcons.telegram_plane,
                color: AppColors.deepGreen,
                size:
                    ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
                        ? null
                        : 24,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   bool isOpen = false;

//   final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

//   double getBtnRowSize(BuildContext context, {double supWidth = 0.0}) =>
//       !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
//           ? MediaQuery.of(context).size.width * 0.9
//           : (MediaQuery.of(context).size.width * 0.6 + supWidth);

//   double getCardImageSize(BuildContext context, {double supWidth = 0.0}) =>
//       !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
//           ? MediaQuery.of(context).size.width * 0.9
//           : (MediaQuery.of(context).size.width * 0.3 + supWidth);

//   double getCardWidth(BuildContext context, {double supWidth = 0.0}) =>
//       !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
//           ? MediaQuery.of(context).size.width * 0.8
//           : (MediaQuery.of(context).size.width * 0.5 + supWidth);

//   double getLogoSize(BuildContext context, {double supWidth = 0.0}) =>
//       !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 120 : 150;

//   double getCardHeight(BuildContext context) =>
//       !ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE") ? 300 : 400;

//   @override
//   Widget build(BuildContext context) {
//     double smallHeight = 80;
//     double headerMinHeight = MediaQuery.of(context).size.height * 0.7;
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.deepGreen,
//         appBar: ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
//             ? largeAppBar(smallHeight: smallHeight)
//             : SmallAppBar(drawerKey: _key),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: ResponsiveRowColumn(
//                 layout: ResponsiveRowColumnType.ROW,
//                 columnCrossAxisAlignment: CrossAxisAlignment.center,
//                 rowCrossAxisAlignment: CrossAxisAlignment.center,
//                 rowMainAxisAlignment: MainAxisAlignment.center,
//                 columnMainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // if (ResponsiveBreakpoints.of(context)
//                   //     .largerThan("MOBILE_LARGE")) ...[
//                   //   ResponsiveRowColumnItem(
//                   //       child: Column(
//                   //     children: [],
//                   //   ))
//                   // ],

//                   ResponsiveRowColumnItem(
//                     columnFit: FlexFit.tight,
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: getCardWidth(context),
//                             margin: const EdgeInsets.all(8.0),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.19),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     margin: const EdgeInsets.all(5),
//                                     padding: const EdgeInsets.all(8),
//                                     decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.black38),
//                                     child: const Icon(LineAwesomeIcons.user,
//                                         color: AppColors.easyGreen, size: 24),
//                                   ),
//                                   Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Text(
//                                           "Saîdou Kanté",
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyLarge!
//                                               .copyWith(
//                                                 color: Colors.white
//                                                     .withOpacity(.9),
//                                                 fontFamily: 'Google Sans',
//                                               ),
//                                         ),
//                                         Text(
//                                           "(+223) 77 51 20 19",
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelSmall!
//                                               .copyWith(
//                                                 color: Colors.white70,
//                                                 fontFamily: 'Google Sans',
//                                               ),
//                                         ),
//                                       ]),
//                                   Container(
//                                     margin: const EdgeInsets.all(5),
//                                     padding: const EdgeInsets.all(8),
//                                     decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.black38),
//                                     child: CustomImageView(
//                                       imagePath: AppImages.circleLogo,
//                                       fit: BoxFit.contain,
//                                       height: 30,
//                                       width: 30,
//                                     ),
//                                   ),
//                                 ]),
//                           ),
//                           // Spacer(),
//                           Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.all(8.0),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 4),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.easyGreen,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Text(
//                                     "Kadija",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(
//                                             color: AppColors.deepGreen,
//                                             fontFamily: "Google Sans",
//                                             fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         Icons.circle,
//                                         size: 5,
//                                         color: AppColors.easyGreen,
//                                       ),
//                                       const SizedBox(width: 5),
//                                       Text(
//                                         "Online",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .labelSmall!
//                                             .copyWith(
//                                                 color: Colors.white70,
//                                                 fontFamily: "Google Sans"),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 CustomImageView(
//                                   imagePath: AppImages.circleLogo,
//                                   fit: BoxFit.contain,
//                                   height: getLogoSize(context),
//                                   width: getLogoSize(context),
//                                   margin: const EdgeInsets.all(8.0),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     "Hi Saïdou, \n How can i help you Today ?",
//                                     textAlign: TextAlign.center,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .copyWith(
//                                             fontFamily: "Google Sans",
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Container(
//                                   width: getBtnRowSize(context),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           margin: const EdgeInsets.all(5),
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: const BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: AppColors.violet),
//                                           child: const Icon(
//                                               LineAwesomeIcons.keyboard,
//                                               color: Colors.white,
//                                               size: 25),
//                                         ),
//                                         const SizedBox(width: 20),
//                                         Recordicon(
//                                           plusWidth: ResponsiveBreakpoints.of(
//                                                       context)
//                                                   .largerThan("MOBILE_LARGE")
//                                               ? 10
//                                               : 30,
//                                           press: () {},
//                                         ),
//                                         const SizedBox(width: 10),
//                                         Container(
//                                           margin: const EdgeInsets.all(5),
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               border: Border.all(
//                                                   color: Colors.white10),
//                                               color: Colors.grey.shade800),
//                                           child: const Icon(Icons.clear_rounded,
//                                               color: Colors.white60, size: 25),
//                                         ),
//                                       ]),
//                                 ),
//                               ]),
//                         ]),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget resizeMe(Widget child) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return SizedBox(
//           width: ResponsiveBreakpoints.of(context).largerThan("MOBILE_LARGE")
//               ? constraints.maxWidth * 0.8
//               : constraints.maxWidth * 0.9,
//           child: child);
//     });
//   }

//   Padding _buildIntroText() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: AutoSizeText(
//         "Veuillez saisir vos informations personnelles",
//         maxLines: 2,
//         presetFontSizes: [18, 15, 13],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           // fontWeight: FontWeight.bold,
//           color: Colors.white.withOpacity(.9),
//           fontFamily: 'Google Sans',
//         ),
//       ),
//     );
//   }

//   Padding _buildSubText() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: AutoSizeText(
//         "Renseignez ses informations afin de continuer",
//         maxLines: 2,
//         presetFontSizes: [14, 13],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           // fontWeight: FontWeight.bold,
//           color: Colors.white.withOpacity(.9),
//           fontFamily: 'Google Sans',
//         ),
//       ),
//     );
//   }
// }

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  SmallAppBar({
    super.key,
    required this.drawerKey,
  });
  GlobalKey<ScaffoldState> drawerKey;

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
              height: 70,
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.easyGreen.withOpacity(0.2)),
          child: IconButton(
            onPressed: () => drawerKey.currentState?.openDrawer(),
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.easyGreen,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}

class largeAppBar extends StatefulWidget implements PreferredSizeWidget {
  largeAppBar({
    super.key,
    required this.smallHeight,
    required this.openDrawer,
  });
  Function() openDrawer;

  final double smallHeight;

  @override
  State<largeAppBar> createState() => _largeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 200);
}

class _largeAppBarState extends State<largeAppBar> {
  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 200),
        child: Container(
          height: 60,
          width: double.infinity,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => widget.openDrawer(),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: AppColors.easyGreen.withOpacity(0.4)
                  ),
                  child: const Icon(CupertinoIcons.bars,
                      color: AppColors.easyGreen, size: 28),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CustomImageView(
                  imagePath: AppImages.verticalLogo,
                  fit: BoxFit.contain,
                  height: 70,
                ),
              ),
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.end,
                  runAlignment: WrapAlignment.spaceBetween,
                  runSpacing: 8,
                  children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        "Saîdou Kanté",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white.withOpacity(.9),
                              fontFamily: 'Google Sans',
                            ),
                      ),
                      Text(
                        "(+223) 77 51 20 19",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white70,
                              fontFamily: 'Google Sans',
                            ),
                      ),
                    ]),
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.easyGreen.withOpacity(0.4)),
                      child: const Icon(LineAwesomeIcons.user,
                          color: AppColors.easyGreen, size: 24),
                    ),
                    const SizedBox(width: 10)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 200);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
