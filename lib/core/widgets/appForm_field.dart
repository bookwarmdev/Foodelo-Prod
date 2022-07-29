import 'package:flutter/material.dart';
import 'package:foodelo/core/core.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    Key? key,
    required this.text,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String text;
  final FormFieldValidator<String?>? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppStyle.bodyText1.copyWith(),
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText ?? false,
            style: AppStyle.subtitle1.copyWith(
              color: AppColor.lightColorScheme.onSurface,
              fontSize: 16.0,
            ),
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyle.subtitle1.copyWith(
                color: AppColor.lightColorScheme.outline,
                fontSize: 16.0,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.lightColorScheme.outline,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              focusColor: AppColor.lightColorScheme.outline,
              errorStyle: AppStyle.caption.copyWith(
                color: AppColor.lightColorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
