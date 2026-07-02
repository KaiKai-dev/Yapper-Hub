import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/data/providers/signup.provider.dart';
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupResultProcessingScreen extends ConsumerStatefulWidget {
  const SignupResultProcessingScreen({super.key});

  @override
  ConsumerState<SignupResultProcessingScreen> createState() => _SignupResultProcessingScreenState();
}

class _SignupResultProcessingScreenState extends ConsumerState<SignupResultProcessingScreen> {

  @override
  void initState() {
    super.initState();
    signup();
  }

  void signup() async {
    final provider = ref.read(signupProvider);
    final data = provider.toMap();

    final result = await HttpService.instance.post(
      ApiRoutes.signup,
      data: data
    );

    log(result.toString());

    final status = result['status'];

    if(status != 200){
      RoutingService.instance.pushNamed(AppScreens.signupError);
      return;
    }

    // TODO: redirect to new page when there is an existing user
    // if(status == 409){
    //   RoutingService.instance.pushNamed(AppScreens.signupAccountExisting);
    // }

    ref.invalidate(signupProvider);
    RoutingService.instance.pushNamed(AppScreens.signupSuccess);
    return;
  }

  @override
  Widget build(BuildContext context) {
     

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              spacing: 80,
              children: [
                Expanded(
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
                  child: Column(
                    spacing: 12,
                    children: [
                      Text(
                        "Creating your Profile.",
                        textAlign: .center,
                        style: context.theme.textTheme.displaySmall
                      ),
                      Text(
                        "Preparing your personalized Yapping space for you...",
                        textAlign: .center,
                        style: context.theme.textTheme.labelMedium
                      )
                    ],
                  )
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}