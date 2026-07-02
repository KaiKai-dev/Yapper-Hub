import 'dart:developer';

import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/constants/home.routes.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:chat_app/features/presentation/chats/chats.screen.dart';
import 'package:chat_app/features/presentation/menu/menu.screen.dart';
import 'package:chat_app/features/presentation/people/people.screen.dart';
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
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    final currentStatePath = widget.state.path;
    final index = homeRoutes.indexWhere((route) => route.path == currentStatePath);
    _currentIndex = index == -1 ? 0 : index; 
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTap(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(index, duration: Durations.medium2, curve: Curves.easeInOutCubicEmphasized);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: const [
            ChatsScreen(),
            PeopleScreen(),
            MenuScreen()
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          landscapeLayout: .centered,
          onTap: onTabTap,
          // onTap: (value) {
          //   if(_currentIndex == value) return;
            
          //   setState(() => _currentIndex = value);
          //   RoutingService.instance.pushNamed(homeRoutes[value]);
          // },
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
