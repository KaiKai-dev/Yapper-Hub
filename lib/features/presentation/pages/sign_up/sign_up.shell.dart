import 'dart:developer';

import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/theme/color_schemes/dark/dark.dart';
import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:chat_app/features/presentation/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupShell extends ConsumerStatefulWidget {
  final Widget child;
  final GoRouterState state;
  const SignupShell({super.key, required this.child, required this.state});

  @override
  ConsumerState<SignupShell> createState() => _SignupShellState();
}

class _SignupShellState extends ConsumerState<SignupShell> {

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final signupData = ref.watch(signupNotifier);

    final signupPages = [
      AppScreens.signupName,
      AppScreens.signupBirthday,
      AppScreens.signupCredentials,
    ];

    

    final currentPage = signupPages.indexWhere(
      (element) => widget.state.topRoute?.name == element.pageName,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Onboarding",
          style: theme.textTheme.titleSmall,
        ),
        leading: IconButton(
          onPressed: () {
            if(currentPage == 0) ref.invalidate(signupNotifier);
            context.pop();
          },
          icon: Icon(Icons.chevron_left, size: 32),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              spacing: 12,
              children: List.generate(
                signupPages.length,
                (page) => Expanded(
                  flex: currentPage == page ? 10 : 9,
                  child: Container(
                    alignment: .center,
                    padding: EdgeInsets.all(currentPage == page ? 4 : 0) ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: currentPage == page ? Border.all(
                        color: colorScheme.primary
                      ) : null,
                    ),
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ref.read(signupNotifier.notifier).isPageFilledUp(page)
                          ? colorScheme.primary
                          : DarkConstants.neutral300,
                      ),
                    ),
                  ),
                )
              ).toList(),
            ),
            widget.child
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .end,
          spacing: 12,
          children: [
            AppButton.primary(
              onPressed: () => ref.read(signupNotifier.notifier)
                .validatePage(
                  currentPage: currentPage,
                  ifValid: () {
                    log("Form Valid ");
                    if(currentPage != signupPages.length - 1) context.pushNamed(signupPages[currentPage + 1].pageName!);
        
                    // Todo add submit function
                  }
                ),
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
