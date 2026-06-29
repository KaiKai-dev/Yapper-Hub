import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends ConsumerStatefulWidget {
  final GoRouterState state;
  final Widget child;
  const HomeShell({
    super.key,
    required this.state,
    required this.child,  
  });

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);

    return SafeArea(
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          landscapeLayout: .centered,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          ],
        ),
      ),
    );
  }
}
