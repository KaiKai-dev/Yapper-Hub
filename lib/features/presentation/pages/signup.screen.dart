import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/data/provider/signup.data.provider.dart';
import 'package:chat_app/features/domain/extra_styles/hyperlink.dart';
import 'package:chat_app/features/presentation/components/app_button.widget.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.birthday.screen.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.credentials.screen.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.name.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final signupData = ref.watch(signupNotifier);

    final CarouselSliderController carouselController = CarouselSliderController();

    // carouselController.

    final screens = [
      SignupNameScreen(),
      SignupBirthdayScreen(),
      SignupCredentialScreen(),
    ];

    // final signupPages = [
    //   AppScreens.signupName,
    //   AppScreens.signupBirthday,
    //   AppScreens.signupCredentials,
    // ];

    // final currentPage = signupPages.indexWhere(
    //   (element) => widget.state.topRoute?.name == element.pageName,
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Onboarding ${signupData.currentPage}",
          style: theme.textTheme.titleSmall,
        ),
        leading: IconButton(
          onPressed: () {
            if(signupData.currentPage == 0){
              log("message");
              ref.invalidate(signupNotifier);
              context.pop();
            } else {
              log("previousPage");
              ref.read(signupNotifier.notifier).previousPage();
              carouselController.previousPage();
            }
          },
          icon: Icon(Icons.chevron_left, size: 32),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: CarouselSlider.builder(
              itemCount: screens.length,
              carouselController: carouselController, 
              // disableGesture: true,
              itemBuilder: (context, index, _){
                return screens[index];
              }, 
              options: CarouselOptions(
                scrollPhysics: NeverScrollableScrollPhysics(),
                pageSnapping: true,
                viewportFraction: 1,
                height: constraints.maxHeight,
                initialPage: 0,
                enableInfiniteScroll: false,
              )
            )
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .end,
          spacing: 12,
          children: [
            AppButton.primary(
              onPressed: () {
                ref.read(signupNotifier.notifier).nextPage();
                  carouselController.nextPage();
                  log("${signupData.currentPage}");
              },
              
              // ref.read(signupNotifier.notifier)
              //   .validatePage(
              //     currentPage: currentPage,
              //     ifValid: () {
              //       log("Form Valid ");
              //       if(currentPage != signupPages.length - 1) context.pushNamed(signupPages[currentPage + 1].pageName!);
        
              //       // Todo add submit function
              //     }
              //   ),
              title: "Next",
            ),
            RichText(
              textAlign: .center,
              text: TextSpan(
                style: theme.textTheme.labelSmall,
                children: [
                  TextSpan(text: "By proceeding, you agree to our "),
                  TextSpan(
                    text: "Terms and service ",
                    style: hyperlinkStyle(context),
                  ),
                  TextSpan(text: "\nand "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: hyperlinkStyle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}