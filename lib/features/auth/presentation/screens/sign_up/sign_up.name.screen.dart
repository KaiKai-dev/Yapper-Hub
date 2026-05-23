import 'package:chat_app/features/auth/data/providers/signup.provider.dart';
import 'package:chat_app/features/auth/domain/enums/validator.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupNameScreen extends ConsumerStatefulWidget {
  const SignupNameScreen({super.key});

  @override
  ConsumerState<SignupNameScreen> createState() => _SignupNameScreenState();
}

class _SignupNameScreenState extends ConsumerState<SignupNameScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = ref.watch(signupProvider);

    return Form(
      key: provider.nameFormKey,
      child: 
      
      Container(
        color: theme.colorScheme.surface,
        child: Column(
          mainAxisSize: .max,
          crossAxisAlignment: .start,
          children: [
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
              controller: provider.firstname,
              validator: Validator.required,
              hintText: "eg. James",
            ),
            Gap(height: 20),
            AppTextField(
              label: "LAST NAME",
              controller: provider.lastname,
              validator: Validator.required,
              hintText: "eg. Yap",
            ),
          ],
        ),
      ),
    );
  }
}
