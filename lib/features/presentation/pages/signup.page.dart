import 'dart:developer';

import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:chat_app/features/presentation/screens/sign_up/sign_up.birthday.screen.dart';
import 'package:chat_app/features/presentation/screens/sign_up/sign_up.credentials.screen.dart';
import 'package:chat_app/features/presentation/screens/sign_up/sign_up.name.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signupData = ref.watch(signupProvider);

    final screens = [
      SignupNameScreen(),
      SignupBirthdayScreen(),
      SignupCredentialScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          signupData.currentPage == 0 
            ? "Exit"
            : "Go Back",
          style: theme.textTheme.titleSmall,
        ),
        leading: IconButton(
          onPressed: () {
            if(signupData.currentPage == 0){
              log("message");
              ref.invalidate(signupProvider);
              context.pop();
            } else {
              log("previousPage");
              tabController.animateTo(signupData.currentPage - 1);
              ref.read(signupProvider.notifier).previousPage();
            }
          },
          icon: Icon(Icons.chevron_left, size: 32),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: screens.map((screen) => Padding(
          padding: EdgeInsets.all(20),
          child: screen,
        )).toList()
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .end,
          spacing: 12,
          children: [
            AppButton.primary(
              onPressed: () {
                ref.read(signupProvider.notifier)
                .validatePage(
                  ifValid: () {
                    tabController.animateTo(signupData.currentPage + 1);
                    ref.read(signupProvider.notifier).nextPage();
                    log("${signupData.currentPage}");
                    // Todo add submit function
                  }
                );
              },
              title: "Next",
            ),
            RichText(
              textAlign: .center,
              text: TextSpan(
                style: theme.textTheme.labelSmall,
                children: [
                  TextSpan(text: "By proceeding, you agree to our "),
                  TextSpan(
                    text: "Terms and service ",
                    style: hyperlinkStyle(context),
                  ),
                  TextSpan(text: "\nand "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: hyperlinkStyle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}