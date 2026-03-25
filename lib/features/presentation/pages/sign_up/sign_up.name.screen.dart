import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:chat_app/features/presentation/components/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
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
    final signupProvider = ref.watch(signupNotifier);

    return SingleChildScrollView(
      child: Form(
        key: signupProvider.nameFormKey,
        child: 
        
        Container(
          color: theme.colorScheme.surface,
          child: Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            children: [
              // Text(
              //   "Onboarding * Step 1",
              //   style: theme.textTheme.labelSmall!.copyWith(
              //     color: theme.colorScheme.primary,
              //     fontWeight: .bold,
              //   ),
              // ),
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
                controller: signupProvider.firstname,
                validator: Validator.required,
                hintText: "eg. James",
              ),
              Gap(height: 20),
              AppTextField(
                label: "LAST NAME",
                controller: signupProvider.lastname,
                validator: Validator.required,
                hintText: "eg. Yap",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
