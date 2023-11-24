import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/common/extension/string_extension.dart';
import 'package:story_app/app/common/utils/payload_manager.dart';
import 'package:story_app/app/routers/named_routes.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/widgets/custom_button.dart';
import 'package:story_app/widgets/custom_dialog.dart';
import 'package:story_app/widgets/custom_form_field.dart';
import 'package:story_app/widgets/password_text_field_widget.dart';

import '../../../app/shared/authenticated_provider/app_auth_provider.dart';
import '../../../providers/auth/auth_provider.dart';
import '../../../providers/auth/auth_state.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useRef(GlobalKey<FormState>()).value;
    final signInState = ref.watch(authStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              Text(
                LocaleKeys.signIn.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              Material(
                borderRadius: BorderRadius.circular(6),
                surfaceTintColor: context.colorScheme.primary,
                color: context.colorScheme.onInverseSurface,
                type: MaterialType.card,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          title: 'E-Mail',
                          hint: LocaleKeys.enterEmail.tr(),
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (String? input) {
                            if (input.isEmail()) {
                              return input.isNotNullOrNotEmpty
                                  ? null
                                  : LocaleKeys.enterEmail.tr();
                            } else {
                              return LocaleKeys.invalidFormat
                                  .tr(args: ['email']);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        PasswordTextField(
                          passwordController: passwordController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              LargeButton(
                title: LocaleKeys.signIn.tr(),
                isLoading: signInState is SignInStateLoading,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final payload = PayloadManager.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    await ref
                        .read(authStateProvider.notifier)
                        .signInUser(payload: payload);

                    await _signInListener(context, ref);
                  }
                },
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.goNamed(NamedRoutes.signUp.name);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: LocaleKeys.didNotHaveAnAccountYet.tr(),
                        style: context.textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: LocaleKeys.signUp.tr(),
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInListener(BuildContext context, WidgetRef ref) async {
    final signInState = ref.watch(authStateProvider);

    await signInState.whenOrNull(
      signInSuccess: (response) async {
        final userModel = response.data;
        if (userModel != null) {
          await ref.read(appAuthProvider.notifier).login(userModel.token);

          if (ref.read(appAuthProvider) != null) {
            context.goNamed(NamedRoutes.home.name);
          }
        }
      },
      signUpError: (httpStatus, message) async {
        await context.showCustomDialog(
          title: "Status Sign In",
          message: "$httpStatus : $message",
          primaryText: "Tutup",
          onPrimaryPressedMulti: () {
            context.pop();
          },
        );
      },
    );
  }
}
