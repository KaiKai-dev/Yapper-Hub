import 'dart:developer';

import 'package:chat_app/core/routing/routing.library.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/auth/data/providers/signup.provider.dart';
import 'package:chat_app/core/theme/styles/hyperlink.dart';
import 'package:chat_app/core/widgets/app_button.widget.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/sign_up.birthday.screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/sign_up.credentials.screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/sign_up.name.screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/result/sign_up.result.error.screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/result/sign_up.result.processing.screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/result/sign_up.result.success.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> with TickerProviderStateMixin {
  late final TabController parentTabController;
  late final TabController tabController;
  late final TabController resultTabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = ref.watch(signupProvider);
    final notifier = ref.watch(signupProvider.notifier);


    final screens = [
      SignupNameScreen(),
      SignupBirthdayScreen(),
      SignupCredentialScreen(),
    ];

    final resultScreens = [
      SignUpProcessingScreen(),
      SignupResultSuccessScreen(),
      SignupResultErrorScreen(),
    ];

    log("Has Changes: ${ref.watch(signupProvider.notifier).hasChanges.toString()}");

    return PopScope(
      canPop: notifier.hasChanges == false,
      onPopInvokedWithResult: onPop,
      child: Scaffold(
        appBar: switch(parentTabController.index) {
          0 => AppBar(
            centerTitle: false,
            title: Text(
              tabController.index == 0
                ? "Exit"
                : "Go Back",
              style: theme.textTheme.titleSmall,
            ),
          ),


          _ => null
        },
        body: TabBarView(
          controller: tabController,
          children: screens.map((screen) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: screen, 
            ),
          )).toList()
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: .end,
            spacing: 12,
            children: [
              ProgressIndicator(
                length: screens.length, 
                currentPage: tabController.index, 
                isFilledUp: (page) => notifier.isPageFilledUp(page),
              ),
              AppButton.primary(
                onPressed: onNext,
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
      ),
    );
  }



  void onPop(bool didPop, res){
    if(didPop) return;

    onBack(tabController.index);
  }
  
  void onBack(int currentPage) async {
    if(currentPage > 0) {
      tabController.animateTo(currentPage - 1);
      return;
    }

    if((await gotPermissionToPop ?? false) && mounted){
      ref.invalidate(signupProvider);
      context.pop();
    }
  }

  Future<bool?> get gotPermissionToPop async => 
    await showDialog<bool>(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: Text("Are you sure you want to close this page?"),
        content: Text("Changes will be discarded"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Continue"),
          ),
        ],
      )
    );


  void onNext() {
    final notifier = ref.read(signupProvider.notifier);

    notifier
      .validatePage(
        currentPage: tabController.index,
        ifValid: () => tabController.animateTo(tabController.index + 1),
        onSubmit: () => RoutingService.instance.router.pushReplacementNamed(AppScreens.signupSuccess.name),
      );
  }
}

class ProgressIndicator extends StatelessWidget {
  final int length, currentPage;
  final bool Function(int page) isFilledUp;
  const ProgressIndicator({
    super.key,
    required this.length, 
    required this.currentPage,
    required this.isFilledUp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 12,
      children: List.generate(
        length,
        (page) => Expanded(
          flex: currentPage == page ? 10 : 9,
          child: Container(
            alignment: .center,
            padding: EdgeInsets.all(currentPage == page ? 4 : 0) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: currentPage == page ? Border.all(
                color: theme.colorScheme.primary
              ) : null,
            ),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isFilledUp(page)
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surfaceDim,
              ),
            ),
          ),
        )
      ).toList(),
    );
  }
}