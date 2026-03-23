import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:chat_app/features/presentation/components/app_text_field.widget.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupNameScreen extends StatelessWidget {
  const SignupNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Onboarding * Step 1",
              style: theme.textTheme.labelSmall!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: .bold,
              ),
            ),
            Gap(height: 16),
            Text("What is your name?", style: theme.textTheme.displaySmall),
            Gap(height: 8),
            Text(
              "Join the Yap Editorial. Tell us how you'd like to be identified in the hub",
              style: theme.textTheme.titleSmall,
            ),
            Gap(height: 40),

            // INPUTS
            AppTextField(
              label: "FIRST NAME",
              controller: firstNameController,
              validator: Validator.required,
              hintText: "eg. James",
            ),
            Gap(height: 20),
            AppTextField(
              label: "LAST NAME",
              controller: lastNameController,
              validator: Validator.required,
              hintText: "eg. Yap",
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: .end,
                spacing: 12,
                children: [
                  AppButton.primary(
                    onPressed: () {
                      if(!formKey.currentState!.validate()) return;

                      context.pushNamed(AppScreens.signupBirthday.pageName!);
                    },
                    title: "Next"
                  ),
                  RichText(
                    textAlign: .center,
                    text: TextSpan(
                      style: theme.textTheme.labelSmall,
                      children: [
                        TextSpan(
                          text: "By proceeding, you agree to our "
                        ),
                        TextSpan(
                          text: "Terms and service ",
                          style: hyperlinkStyle(context)
                        ),
                        TextSpan(
                          text: "and "
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: hyperlinkStyle(context)
                        ),
                      ]
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
