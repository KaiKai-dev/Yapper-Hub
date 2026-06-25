import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);

    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            "Home Page",
            textAlign: .center,
          ),
          TextButton(onPressed: () async {
            await authNotifier.logout();

            RoutingService.instance.pushNamed(.welcome);
          }, child: Text("Logout")),
          // TextButton(onPressed: () => StorageService.instance.secureReset(), child: Text("reset secure"))
        ],
      ),
    ));
  }
}