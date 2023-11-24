import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String? hint;
  final bool isObscureText;
  final bool isExpanded;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;

  const CustomFormField({
    super.key,
    required this.title,
    this.hint,
    this.isObscureText = false,
    this.isExpanded = false,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    this.inputFormatter,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: isObscureText,
          controller: controller,
          maxLines: isExpanded ? 6 : 1,
          keyboardType: textInputType,
          validator: validator,
          inputFormatters: inputFormatter,
          style: context.appTheme.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.onSurface),
          decoration: InputDecoration(
            /// based border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            suffixIcon: suffixIcon,

            /// border default
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: context.colorScheme.outline,
              ),
            ),

            /// focus border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            hintText: hint,
            hintStyle: context.textTheme.bodyLarge
                ?.copyWith(color: context.colorScheme.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}
