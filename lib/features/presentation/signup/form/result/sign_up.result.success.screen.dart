import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/widgets/app_button.widget.dart';
import 'package:chat_app/features/data/services/routing.service.dart';
import 'package:chat_app/features/presentation/signup/widgets/yapper_features_card.widget.dart';
import 'package:flutter/material.dart';

class SignupResultSuccessScreen extends StatelessWidget {
  const SignupResultSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double headerBadgeSize = 100;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .center,
              children: [
                // * Success Icon
                Container(
                  height: headerBadgeSize,
                  width: headerBadgeSize,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(headerBadgeSize / 2),
                    border: Border.all(
                      width: .15,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 30,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: headerBadgeSize / 2,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 40),

                Text(
                  'Welcome to Yapper-Hub',
                  textAlign: .center,
                  style: theme.textTheme.displaySmall!.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Your account has been successfully created. Ready to join the conversation?',
                  textAlign: .center,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 24),

                YapperFeaturesCard(
                  title: 'AI Assistant',
                  message:
                      'Yapper AI is ready to help you summarize long yap threads',
                  icon: Icon(Icons.star, color: Colors.purple.shade200),
                ),
                SizedBox(height: 16),
                YapperFeaturesCard(
                  icon: Icon(Icons.lock, color: theme.colorScheme.primary),
                  title: 'Secure Sync',
                  message:
                      'End-to-end encryption active acrosss all your devices',
                ),
                SizedBox(height: 32),

                AppButton.primary(
                  title: 'Get Started',
                  onPressed: () => RoutingService.instance.router
                      .pushReplacementNamed(AppScreens.welcome.name),
                ),
                SizedBox(height: 12),
                Text(
                  'SECURED BY YAPPER CLOUD PROTOCOL',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
