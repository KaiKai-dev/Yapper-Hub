import 'package:chat_app/core/theme/color_schemes/dark/dark.dart';
import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:chat_app/features/presentation/components/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupBirthdayScreen extends ConsumerWidget {
  const SignupBirthdayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final signupProvider = ref.watch(signupNotifier);
    
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: signupProvider.birthdayFormKey,
      child: Container(
        color: theme.colorScheme.surface,
        child: Column(
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
            Text("When is your birthday?", style: theme.textTheme.displaySmall),
            Gap(height: 8),
            Text(
              "Your profile won't show this information",
              style: theme.textTheme.titleSmall,
            ),
            Gap(height: 40),
            
            // INPUTS
            DropdownMenu<String>(
              initialSelection: 'User',
              label: const Text("Account Type"),
              // Styles the "box" using your theme
              inputDecorationTheme: theme.inputDecorationTheme, 
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(DarkConstants.neutral800),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'User', label: 'Standard User'),
                DropdownMenuEntry(value: 'Editor', label: 'Editorial Staff'),
              ],
              onSelected: (value) => print(value),
            ),
          ],
        ),
      ),
    );
  }
}