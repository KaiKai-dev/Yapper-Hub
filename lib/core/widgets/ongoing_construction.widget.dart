import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OngoingConstructionWidget extends StatelessWidget {
  const OngoingConstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          // mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: .end,
                children: [
              
                SvgPicture.asset(
                  'assets/app_illustrations/coming soon.svg',
                  height: 200,
                ),
                SizedBox(height: 52),
                Text(
                  "This page is\ncurrently under\nconstruction",
                  textAlign: .center,
                  style: context.textTheme.displaySmall
                ),
                ]
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "We're working hard to bring you more Yapping spaces. You can check back soon!",
                textAlign: .center,
                style: context.textTheme.bodyMedium
              ),
            )
          ]    
        ),
      ),
    );
  }
}