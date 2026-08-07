import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/core/theme/theme.provider.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.account_circle_outlined,
          size: 32,
        ),
        title: Text(
          "Yapper Hub",
          style: context.theme.textTheme.displaySmall!.copyWith(
            fontSize: 28,
            color: context.theme.colorScheme.primary
          ),
        ),
        centerTitle: false,
        actions: [
          Icon(
            Icons.edit
          ),
          Switch(
            value: themeNotifier.currentTheme == ThemeMode.light,
            onChanged: (value) => themeNotifier.toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 16,
            children: [
              AppTextField(
                hintText: "Search Conversations",
                prefix: Icon(
                  Icons.search
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      spacing: 12,
                      children: [
                        InkWell(
                          onTap: () async {
                            final result = await HttpService.instance.get(
                              ApiRoutes.getProfile(id: 1),
                              queries: {
                                "id": 1
                              }
                            );

                            log(result.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.theme.inputDecorationTheme.enabledBorder!.borderSide.color,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                strokeWidth: 1.25,
                                radius: Radius.circular(100),
                                padding: EdgeInsets.all(20),
                                color: context.theme.inputDecorationTheme.hintStyle!.color!,
                                dashPattern: [4, 2],
                              ),
                              child: Icon(
                                Icons.add,
                                // color: context.theme.inputDecorationTheme.hintStyle!.color!,
                              )
                            ),
                          ),
                        ),
                        Text(
                          "Your Story",
                          style: context.textTheme.bodySmall,
                        )
                      ],
                    )
                    // Container(
                    //   padding: EdgeInsets.all(16),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       width: 1,
                    //       style: 
                    //     ),
                    //     borderRadius: BorderRadius.circular(100)
                    //   ),
                      // child: Icon(
                      //   Icons.add
                      // ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}