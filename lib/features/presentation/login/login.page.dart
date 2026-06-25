import 'package:chat_app/core/widgets/app_button.widget.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static final String pageName = "LoginScreen";

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     
    final textTheme = context.theme.textTheme;

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
                          color: context.theme.colorScheme.primary,
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
                          color: textTheme.labelMedium!.color,
                        ),
                      ),
                      Text('OR'),
                      Expanded(
                        child: Divider(
                          color: textTheme.labelMedium!.color,
                        ),
                      ),
                    ],
                  ),
                  AppButton.surface(
                    title: 'Create new Account',
                    onPressed: () => RoutingService.instance.pushNamed(.signup),
                  )
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
    final authNotifier = ref.read(authProvider.notifier);

    await authNotifier.login(data: {
      'email'     : emailController.value.text,
      'password'  : passwordController.value.text
    });
  }
}
