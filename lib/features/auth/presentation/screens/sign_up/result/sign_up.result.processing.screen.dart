import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/core/routing/routing.library.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
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
    signup();
    super.initState();
  }

  void signup() async {
    final provider = ref.read(signupProvider);

    final result = await HttpService.instance.post(
      ApiRoutes.signup,
      data: provider.toMap() 
    );

    if(result != null && result['status'] == 'success'){
      RoutingService.instance.router.pushReplacementNamed(AppScreens.signupSuccess.name);
    }
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