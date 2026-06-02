
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/data/services/routing.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
    await Future.delayed(Duration(seconds: 5));
    if(mounted) RoutingService.instance.pushNamed(.welcome);
  }
}