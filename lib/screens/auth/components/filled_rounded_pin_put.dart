import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatefulWidget {
  TextEditingController codeController;
  FilledRoundedPinPut({Key? key, required this.codeController})
      : super(key: key);

  @override
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.codeController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 4;
    Color borderColor = Colors.white70.withOpacity(0.19);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width > 400
          ? 56
          : ((56 * (MediaQuery.of(context).size.width)) / 400),
      height: MediaQuery.of(context).size.width > 400
          ? 56
          : (((56 * (MediaQuery.of(context).size.width)) / 400) + 10),
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.easyGreen,
            fontWeight: FontWeight.bold,
            fontFamily: 'Google Sans',
          ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
          border: Border.all(
            color: Colors.white70.withOpacity(0.19),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(-0.5, 1.2), // changes position of shadow
            ),
          ]),
    );
    //widget.codeController.text = context.read<AuthProvider>().lesmsCode;
    return SizedBox(
      height: 68,
      child: Pinput(
        autofillHints: const [
          '*',
          '*',
          '*',
          '*',
        ],
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        length: length,
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
        //androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsUserConsentApi,
        //androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
        // listenForMultipleSmsOnAndroid: true,
        controller: widget.codeController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin == '******');
        },
        keyboardType: TextInputType.number,
        showCursor: true,
        disabledPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          width: (MediaQuery.of(context).size.width > 400
              ? 46
              : ((46 * (MediaQuery.of(context).size.width)) / 400) + 2),
          height: (MediaQuery.of(context).size.width > 400
                  ? 56
                  : (((46 * (MediaQuery.of(context).size.width)) / 400) + 10)) +
              2,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
