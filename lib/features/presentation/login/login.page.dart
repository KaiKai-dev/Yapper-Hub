import 'dart:developer';

import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/core/widgets/app_button.widget.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/data/services/routing.service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String pageName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Yapper Hub',
            style: textTheme.titleLarge!.copyWith(fontWeight: .w900),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  Text("Login", style: textTheme.displayMedium),
                  Text(
                    "Welcome back. Continue your conversations in the broad expanse of the hub.",
                  ),
                ],
              ),

              Column(
                spacing: 16,
                children: [
                  AppTextField(
                    controller: emailController,
                    label: "Email Address",
                    hintText: "name@example.com",
                  ),
                  AppTextField.password(
                    controller: passwordController,
                    counter: TextButton(
                      onPressed: onForgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                spacing: 20,
                children: [
                  AppButton.primary(title: "Login", onPressed: onLogin),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Divider(
                          color: theme.textTheme.labelMedium!.color,
                        ),
                      ),
                      Text('OR'),
                      Expanded(
                        child: Divider(
                          color: theme.textTheme.labelMedium!.color,
                        ),
                      ),
                    ],
                  ),
                  AppButton.surface(
                    title: 'Create new Account',
                    onPressed: () => RoutingService.instance.pushNamed(.signup),
                  )
                  // GestureDetector(
                  //   child: Text('Create new Account', style: theme.textTheme.labelLarge!.copyWith(
                  //     color: theme.colorScheme.onSurface
                  //   )),
                  //   onTap: () => RoutingService.instance.pushNamed(.signup),
                  // ),
                ],
              ),

              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void onForgotPassword() {}

  void onLogin() async {

    log({
        'email': emailController.value.text,
        'password': passwordController.value.text
      }.toString());
    final response = await HttpService.instance.post(
      ApiRoutes.login,
      data: {
        'email': emailController.value.text,
        'password': passwordController.value.text
      }
    );

    log(response.toString());
  }
}
