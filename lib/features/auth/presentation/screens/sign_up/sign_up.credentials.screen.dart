import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
import 'package:chat_app/features/presentation/components/inputs/app_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupCredentialScreen extends ConsumerStatefulWidget {
  const SignupCredentialScreen({super.key});

  static final String pathName = "SignupCredentialScreen";

  @override
  ConsumerState<SignupCredentialScreen> createState() => _SignupCredentialScreenState();
}

class _SignupCredentialScreenState extends ConsumerState<SignupCredentialScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);

    return Form(
      key: provider.credentialsFormKey,
      child: Container(
        color: theme.colorScheme.surface,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Gap(height: 16),
            RichText(
              text: TextSpan(
                style: theme.textTheme.displaySmall,
                children: [
                  TextSpan(text: "Secure your "),
                  TextSpan(text: "Yapping ", style: TextStyle(
                    color: theme.colorScheme.primary
                  )),
                  TextSpan(text: "space "),
                ]
              )
            ),
            Gap(height: 8),
            Text(
              "Enter your credentials to begin exploring the editorial side of conversation.",
              style: theme.textTheme.titleSmall,
            ),
            Gap(height: 40),

            // INPUTS
            AppTextField(
              controller: provider.email,
              label: "E-MAIL ADDRESS",
              validator: Validator.required,
            ),

            AppTextField(
              controller: provider.password,
              label: "PASSWORD",
              validator: Validator.password,
            )
          ],
        ),
      ),
    );
  }
}