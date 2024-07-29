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
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
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
              color: Color.fromRGBO(147, 175, 192, 0.4),
              fontSize: 14,
            ),
            suffixIcon: icon,
            contentPadding: const EdgeInsets.all(14),
            filled: true,
            fillColor: const Color.fromRGBO(228, 237, 244, 0.3),
            // enabledBorder: outlinedBorderGray,
            //
            // focusedBorder: outlinedBorderGray,
            // focusedErrorBorder: outlinedBorderGray,
            // errorBorder: outlinedBorderRed,
            errorText: errorText,
          ),
          style: const TextStyle(fontSize: 20),
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
                    // color: Palette.mediumGrey,
                    fontSize: 12,
                  ),
            ),
          ),
      ],
    );
  }
}
