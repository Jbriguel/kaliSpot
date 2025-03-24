import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:kalispot/theme/colors/appColors.dart';

class InputWithcountry extends StatefulWidget {
  InputWithcountry({
    super.key,
    required this.countryDialCodeController,
    required this.numberController,
  });

  TextEditingController countryDialCodeController;
  TextEditingController numberController;

  @override
  State<InputWithcountry> createState() => _InputWithcountryState();
}

class _InputWithcountryState extends State<InputWithcountry> {
  // Variable pour stocker la sélection du radio bouton
  String selectedOption = 'Pour moi'; // Par défaut, "Pour moi" est sélectionné
  bool get isForMe => selectedOption == 'Pour moi';

  double radius = 10;

  initState() {
    super.initState();
    widget.countryDialCodeController.text = "+223";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.85,
        margin: EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.19),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Sélection du pays (indicatif téléphonique)
                CountryListPick(
                  pickerBuilder: (context, CountryCode? countryCode) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(countryCode?.dialCode ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontFamily: "Aller",
                                      color: Colors.black)),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.easyGreen,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              width: 1,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade600),
                            ),
                          ),
                        ]);
                  },
                  initialSelection: widget.countryDialCodeController.text,
                  onChanged: isForMe
                      ? null
                      : (CountryCode? code) {
                          setState(() {
                            widget.countryDialCodeController.text =
                                code!.dialCode!;
                          });
                        },
                ),

                // Champ de saisie du numéro de téléphone
                Expanded(
                  child: TextFormField(
                    controller: widget.numberController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: "Google Sans",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                    cursorColor: AppColors.easyGreen,
                    decoration: InputDecoration(
                      hintText: "Numéro de téléphone",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontFamily: "Google Sans",
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                      fillColor: Colors.white70.withOpacity(0.19),

                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(radius),
                      //     borderSide: BorderSide(
                      //       color: Colors.white70.withOpacity(0.19),
                      //     )),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(radius),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70.withOpacity(0.19),
                      //   ),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(radius),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70.withOpacity(0.19),
                      //   ),
                      // ),
                      // disabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(radius),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70.withOpacity(0.19),
                      //   ),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(radius),
                      //   borderSide: BorderSide(
                      //     color: Colors.red.shade400,
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
