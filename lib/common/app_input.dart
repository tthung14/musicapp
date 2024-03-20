import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String? label;
  final String placeholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Function(String value)? onValueChange;
  final String? errorText;
  final bool focus;
  final TextInputType? textInputType;
  const AppInput(
      {super.key,
      required this.placeholder,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.onValueChange,
      this.errorText,
      this.focus = false,
      this.textInputType,
      this.label});

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label ?? '',
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (label != null)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          obscureText: obscureText ?? false,
          onChanged: onValueChange,
          focusNode: focus ? myFocusNode : null,
          keyboardType: textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            errorText: errorText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color(0xffFAFAFA),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: placeholder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
