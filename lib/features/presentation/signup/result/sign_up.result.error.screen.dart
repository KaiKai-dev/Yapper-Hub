import 'package:chat_app/core/widgets/app_button.widget.dart';
import 'package:chat_app/features/data/providers/signup.provider.dart';
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupResultErrorScreen extends ConsumerStatefulWidget {
  const SignupResultErrorScreen({super.key});

  @override
  ConsumerState<SignupResultErrorScreen> createState() => _SignupResultErrorScreenState();
}

class _SignupResultErrorScreenState extends ConsumerState<SignupResultErrorScreen> {
  bool trying = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double headerBadgeSize = 100;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: 32
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // * Error Icon
              Container(
                height: headerBadgeSize,
                width: headerBadgeSize,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(headerBadgeSize / 2),
                  border: Border.all(
                    width: .15,
                    color: theme.colorScheme.error,
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 30,
                      color: theme.colorScheme.error,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.error,
                  size: headerBadgeSize / 2,
                  color: theme.colorScheme.error,
                ),
              ),
              SizedBox(height: 40),
        
              Text(
                "Something went wrong",
                textAlign: .center,
                style: theme.textTheme.displaySmall!.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                )
              ),
              SizedBox(height: 24),
              Text(
                'We couldn\'t create your account right now. Please check your connection and try again.',
                textAlign: .center,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 24),
              Spacer(),

              AppButton.primary(title: 'Try Again', onPressed: onRetry),
              SizedBox(height: 16,),
              AppButton.neutral(title: 'Back to Welcome Page', onPressed: () {
                ref.invalidate(signupProvider);
                RoutingService.instance.pushNamed(.welcome);
              })
            ],
          ),
        ),
      ),
    );
  }

  void onRetry() => RoutingService.instance.pushNamed(.signupProcessing);
}
