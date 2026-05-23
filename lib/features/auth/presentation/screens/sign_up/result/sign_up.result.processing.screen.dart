import 'package:chat_app/features/auth/data/providers/signup.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpProcessingScreen extends ConsumerStatefulWidget {
  const SignUpProcessingScreen({super.key});

  @override
  ConsumerState<SignUpProcessingScreen> createState() => _SignUpProcessingScreenState();
}

class _SignUpProcessingScreenState extends ConsumerState<SignUpProcessingScreen> {

  @override
  void initState() {
    final provider = ref.read(signupProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 24,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: .bottomCenter,
                child: CircularProgressIndicator(
                  constraints: BoxConstraints(
                    minHeight: 80,
                    minWidth: 80,
                  ),
                  strokeWidth: 3
                )
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    "Creating your Profile.",
                    textAlign: .center,
                    style: theme.textTheme.displaySmall
                  ),
                  Text(
                    "Preparing your personalized Yapping space for you...",
                    textAlign: .center,
                    style: theme.textTheme.labelMedium
                  )
                ],
              )
            ),
            
          ],
        ),
      ),
    );
  }
}