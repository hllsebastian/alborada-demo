import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.onChanged,
    super.key,
    this.text,
    this.obscureText = false,
    this.icon,
    this.subText,
    this.errorText,
    this.textHelp,
    this.textEditingController,
    this.initialValue,
    this.hintText,
    this.validatorText,
    this.required = false,
    this.keyboardType,
    this.inputFormatters,
    this.textStyle = const TextStyle(
      fontFamily: 'outfit',
      fontSize: 14,
      letterSpacing: 0.03,
      height: 1.3,
    ),
    this.maxLines,
  });

  final ValueChanged<String>? onChanged;
  final String? validatorText;
  final String? text;
  final bool obscureText;
  final Widget? icon;
  final String? subText;
  final String? errorText;
  final String? textHelp;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String? hintText;
  final bool required;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle textStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Row(
            children: [
              Text(
                text!,
                // style: context.bodySmall?.copyWith(
                //   fontWeight: FontWeight.w800,
                //   color: Palette.mediumGrey,
                // ),
              ),
              if (required) ...[
                // space4,
                const Text(
                  '*',
                  // style: context.bodySmallStyle,
                ),
              ],
              if (subText != null) ...[
                const Spacer(),
                Text(
                  subText ?? '',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ],
          ),
        const SizedBox(height: 12),
        TextFormField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          style: textStyle,
          initialValue: initialValue,
          controller: textEditingController,
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return validatorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xff62667D),
              fontSize: 14,
            ),
            suffixIcon: icon,
            contentPadding: const EdgeInsets.all(14),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.red)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Color(0xffC0C1C9)),
            ),
            //
            // focusedBorder: outlinedBorderGray,
            // focusedErrorBorder: outlinedBorderGray,
            // errorBorder: outlinedBorderRed,
            errorText: errorText,
          ),
          onChanged: onChanged,
          key: Key(initialValue.toString()),
        ),
        if (textHelp != null)
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              textHelp!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
            ),
          ),
      ],
    );
  }
}
