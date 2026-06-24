
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback( (_) => initApp());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 32,
          children: [
            SvgPicture.asset(
              'assets/app_logos/chat app.svg',
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .6,
              child: LinearProgressIndicator(
                color: Colors.blue.shade400,
                backgroundColor: Colors.blueGrey.shade50,
              ),
            )
          ],
        ),
      )
    );
  }

  void initApp() async {
    await ref.read(authProvider.notifier).restoreSession();

    if(!mounted) return; 

    RoutingService.instance.pushNamed(switch(ref.read(authProvider) == null) {
      true => .welcome,
      false => .home,
    });
  }
}