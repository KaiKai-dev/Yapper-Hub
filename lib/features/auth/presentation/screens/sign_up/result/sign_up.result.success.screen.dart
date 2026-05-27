import 'package:flutter/material.dart';

class SignupResultSuccessScreen extends StatelessWidget {
  const SignupResultSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant
            ),
          )
        ]
      ),
    );
  }
}