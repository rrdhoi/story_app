import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/common/extension/string_extension.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/widgets/custom_dialog.dart';
import 'package:story_app/widgets/custom_form_field.dart';

import '../../../app/routers/named_routes.dart';
import '../../../providers/auth/auth_provider.dart';
import '../../../providers/auth/auth_state.dart';
import '../../../widgets/custom_button.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordSecondaryController = useTextEditingController();
    final isObscurePassword = useState(true);
    final formKey = useRef(GlobalKey<FormState>()).value;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.goNamed(NamedRoutes.signIn.name);
          return Future.value(true);
        },
        child: SafeArea(
          child: Form(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                Text(
                  LocaleKeys.signUp.tr(),
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
                            title: LocaleKeys.name.tr(),
                            hint: LocaleKeys.enterName.tr(),
                            controller: nameController,
                            textInputType: TextInputType.name,
                            validator: (String? input) {
                              return input.isNotNullOrNotEmpty
                                  ? null
                                  : LocaleKeys.enterName.tr();
                            },
                          ),
                          const SizedBox(height: 16),
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
                                    .tr(args: ["email"]);
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomFormField(
                            title: 'Password',
                            hint: LocaleKeys.enterPassword.tr(),
                            isObscureText: isObscurePassword.value,
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isObscurePassword.value =
                                    !isObscurePassword.value;
                              },
                              child: Icon(
                                isObscurePassword.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 20,
                              ),
                            ),
                            controller: passwordController,
                            validator: (String? input) =>
                                input.isNotNullOrNotEmpty
                                    ? null
                                    : LocaleKeys.enterPassword.tr(),
                          ),
                          const SizedBox(height: 16),
                          CustomFormField(
                            controller: passwordSecondaryController,
                            title: LocaleKeys.reEnterPassword.tr(),
                            hint: LocaleKeys.reEnterPassword.tr(),
                            isObscureText: isObscurePassword.value,
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isObscurePassword.value =
                                    !isObscurePassword.value;
                              },
                              child: Icon(
                                isObscurePassword.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 20,
                              ),
                            ),
                            validator: (String? input) {
                              if (input.isNotNullOrNotEmpty) {
                                return passwordController.text == input
                                    ? null
                                    : LocaleKeys.passwordDoesNotMatch.tr();
                              } else {
                                return LocaleKeys.enterPassword.tr();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                LargeButton(
                  title: LocaleKeys.signUp.tr(),
                  isLoading: ref.watch(authStateProvider) is SignInStateLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await ref.read(authStateProvider.notifier).signUpUser(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                      await _listenerSignInProvider(ref, context);
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.goNamed(NamedRoutes.signIn.name);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: LocaleKeys.alreadyHaveAnAccount.tr(),
                          style: context.textTheme.bodyLarge,
                          children: [
                            TextSpan(
                              text: LocaleKeys.signIn.tr(),
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
      ),
    );
  }

  Future<void> _listenerSignInProvider(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final signInState = ref.watch(authStateProvider);

    await signInState.whenOrNull(
      signUpSuccess: (message) async {
        await context.showCustomDialog(
          title: "Status Sign Up",
          message: message,
          primaryText: LocaleKeys.close.tr(),
          onPrimaryPressedMulti: () {
            context.goNamed(NamedRoutes.signIn.name);
          },
        );
      },
      signUpError: (httpStatus, message) async {
        await context.showCustomDialog(
          title: "Status Sign Up",
          message: "$httpStatus : $message",
          primaryText: LocaleKeys.close.tr(),
          onPrimaryPressedMulti: () {
            context.pop();
          },
        );
      },
    );
  }
}
