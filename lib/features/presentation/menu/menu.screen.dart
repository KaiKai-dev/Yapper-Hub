import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await ref.read(authProvider.notifier).logout();

            RoutingService.instance.router.replace(AppScreens.welcome.path!);
          }, 
          child: Text("Logout")
        )
      )
    );
  }
}