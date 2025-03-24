import 'package:flutter/material.dart';
import 'package:kalispot/theme/colors/appColors.dart';

Future<DateTime?> openCalendar(BuildContext context,
    {required String helpText}) async {
  return await showDatePicker(
      barrierColor: Colors.black12,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1),
      lastDate: DateTime(DateTime.now().year + 5, 12),
      locale: const Locale('fr', 'FR'),
      helpText: helpText,
      confirmText: "Valider",
      cancelText: "Fermer",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            cardTheme: const CardTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              elevation: 1.0,
              shadowColor: Colors.black26,
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // bannerTheme: const MaterialBannerThemeData(
            //     backgroundColor: AppColors.deepGreen),
            dividerTheme: const DividerThemeData(color: Colors.black38),
            colorScheme: const ColorScheme.light(
              primary: AppColors.deepGreen,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textTheme: TextTheme(
                bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.easyGreen, fontFamily: "Poppins")),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    AppColors.deepGreen, // Couleur de l'en-tête et des boutons
                // Couleur des boutons
              ),
            ),
            dialogBackgroundColor:
                Colors.grey.shade200, // Couleur de fond du Card
            dividerColor: Colors.grey.shade400,
            useMaterial3: false,
          ),
          child: child!,
        );
      }
      //locale: Locale('fr', 'CH'),
      );
}
