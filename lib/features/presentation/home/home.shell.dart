import 'dart:developer';

import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/constants/home.routes.dart';
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
  late int currentIndex;

  @override
  void initState() {
    final currentStatePath = widget.state.path;
    final index = homeRoutes.indexWhere((route) => route.path == currentStatePath);
    currentIndex = index == -1 ? 0 : index; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          landscapeLayout: .centered,
          onTap: (value) {
            if(currentIndex == value) return;
            
            setState(() => currentIndex = value);
            RoutingService.instance.pushNamed(homeRoutes[value]);
          },
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
