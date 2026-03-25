import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/data/provider/theme.provider.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  static final String pageName = "WelcomeScreen";

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final themeNotifier = ref.watch(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 1,
        title: Text('v1.0.0', style: theme.textTheme.labelMedium),
        centerTitle: false,
        actions: [
          Switch(
            value: themeNotifier.currentTheme == ThemeMode.light,
            onChanged: (value) => themeNotifier.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: .symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          spacing: 16,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: .spaceBetween,
                spacing: 16,
                children: [
                  Image.asset('assets/app_logos/chat_app.png', height: 150),
                  Column(
                    spacing: 8,
                    children: [
                      Text("Yapper Hub", style: theme.textTheme.displaySmall!),
                      Text(
                        "Sign in to continue chatting with friends, join rooms and share stories.",
                        textAlign: .center,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                  AppButton(
                    onPressed: () {},
                    title: "Login",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  AppButton.neutral(
                    onPressed: () {
                      context.pushNamed(AppScreens.signupName.pageName!);
                    },
                    title: "Create an Account",
                  ),

                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceEvenly,
                          crossAxisAlignment: .center,
                          spacing: 12,
                          children: [
                            Expanded(child: Divider(color: theme.textTheme.labelMedium!.color,)),
                            Text("OR JOIN WITH", style: theme.textTheme.bodySmall),
                            Expanded(child: Divider(color: theme.textTheme.labelMedium!.color,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceAround,
                          spacing: 12,
                          children: [
                            // Expanded(
                            //   child: AppButton.neutral(
                            //     icon: ,
                            //     title: "Google"
                            //   ),
                            // ),
                            Expanded(
                              child: AppButton.neutral(
                                onPressed: (){},
                                icon: Icons.facebook,
                                title: "Facebook"
                              ),
                            ),
                            Expanded(
                              child: AppButton.neutral(
                                onPressed: (){},
                                icon: Icons.apple,
                                title: "Apple",
                              ),
                            )
                          ]
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 5,
                    child: Center(
                      child: RichText(
                        textAlign: .center,
                        text: TextSpan(
                          style: theme.textTheme.labelSmall,
                          children: [
                            TextSpan(
                              text: "By continuing, you agree to our "
                            ),
                            TextSpan(
                              text: "Terms of Service ",
                              recognizer: TapGestureRecognizer(),
                              style: hyperlinkStyle(context)
                            ),
                            TextSpan(
                              text: "and "
                            ),
                            TextSpan(
                              text: "Privacy Policy ",
                              style: hyperlinkStyle(context)
                            ),
                          ]
                        )
                      ),
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
