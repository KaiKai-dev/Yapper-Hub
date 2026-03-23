import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupShell extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const SignupShell({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  State<SignupShell> createState() => _SignupShellState();
}

class _SignupShellState extends State<SignupShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: widget.child,
    );
  }
}