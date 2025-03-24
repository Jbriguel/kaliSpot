import 'package:flutter/material.dart';
import 'package:kalispot/theme/colors/appColors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.obscureText = false,
    this.isLabel = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.suffix,
    this.contentPadding,
    this.fillColor,
    this.textColor = Colors.white,
    this.filled = true,
    this.enable = true,
    this.validator,
  }) : super(
          key: key,
        );

  final bool enable;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final Widget? prefix;

  final Widget? suffix;

  final EdgeInsets? contentPadding;

  final Color? fillColor;

  final Color textColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final bool? isLabel;

  TextStyle? textStyle;
  double radius = 25.0;
  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.bodySmall;
    return textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          enabled: enable,
          controller: controller,
          //focusNode: focusNode ?? FocusNode(),
          cursorColor: AppColors.easyGreen.withOpacity(0.8),
          autofocus: autofocus!,
          style: textStyle!.copyWith(
              fontFamily: "Aller",
              color: textColor.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onTapOutside: (event) {
            print('onTapOutside');
          },
        ),
      );

  InputDecoration get decoration => InputDecoration(
        labelText: isLabel! ? hintText ?? "" : null,
        labelStyle: isLabel!
            ? textStyle!.copyWith(
                color: textColor.withOpacity(0.8),
                fontSize: 15,
              )
            : null,
        hintText: !isLabel! ? hintText ?? "" : null,
        hintStyle: !isLabel!
            ? textStyle!.copyWith(
                color: textColor.withOpacity(0.8),
                fontSize: 15,
              )
            : null,
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        fillColor: fillColor ?? Colors.white70.withOpacity(0.19),
        filled: filled,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: fillColor ?? Colors.white70.withOpacity(0.19),
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: fillColor ?? Colors.white70.withOpacity(0.19),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: fillColor ?? Colors.white70.withOpacity(0.19),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: fillColor ?? Colors.white70.withOpacity(0.19),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Colors.red.shade400,
          ),
        ),
      );

  _prefixIcon(IconData iconData) {
    return Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(10.0))),
        child: Icon(
          iconData,
          size: 20,
          color: Colors.grey.shade200,
        ));
  }
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillWhiteA => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      );
}
