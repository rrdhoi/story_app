import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:story_app/app/common/extension/string_extension.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/widgets/custom_form_field.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({required this.passwordController, super.key});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(true);
    return CustomFormField(
      title: 'Password',
      hint: LocaleKeys.enterPassword.tr(),
      isObscureText: isObscure.value,
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          isObscure.value = !isObscure.value;
        },
        child: Icon(
          isObscure.value ? Icons.visibility_off : Icons.visibility_rounded,
          size: 20,
        ),
      ),
      controller: passwordController,
      validator: (String? input) =>
          input.isNotNullOrNotEmpty ? null : LocaleKeys.enterPassword.tr(),
    );
  }
}
