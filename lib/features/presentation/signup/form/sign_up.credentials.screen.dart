import 'package:chat_app/features/data/providers/signup.provider.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:chat_app/core/widgets/gap.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupCredentialScreen extends ConsumerStatefulWidget {
  const SignupCredentialScreen({super.key});

  // static final String pathName = "SignupCredentialScreen";

  @override
  ConsumerState<SignupCredentialScreen> createState() => _SignupCredentialScreenState();
}

class _SignupCredentialScreenState extends ConsumerState<SignupCredentialScreen> {
  @override
  Widget build(BuildContext context) {
     
    final provider = ref.watch(signupProvider);
    // final notifier = ref.read(signupProvider.notifier);

    return Form(
      key: provider.credentialsFormKey,
      child: Container(
        color: context.theme.colorScheme.surface,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Gap(height: 16),
            RichText(
              text: TextSpan(
                style: context.theme.textTheme.displaySmall,
                children: [
                  TextSpan(text: "Secure your "),
                  TextSpan(text: "Yapping ", style: TextStyle(
                    color: context.theme.colorScheme.primary
                  )),
                  TextSpan(text: "space "),
                ]
              )
            ),
            Gap(height: 8),
            Text(
              "Enter your credentials to begin exploring the editorial side of conversation.",
              style: context.theme.textTheme.titleSmall,
            ),
            Gap(height: 40),

            // INPUTS
            AppTextField(
              controller: provider.email,
              label: "EMAIL ADDRESS",
              hintText: "sample@email.com",
              validator: Validator.required,
            ),
            Gap(height: 20),

            AppTextField.password(
              controller: provider.password,
              label: "PASSWORD",
              hintText: "Enter here",
              suffix: Icon(Icons.visibility, size: 20,),
            )
          ],
        ),
      ),
    );
  }
}