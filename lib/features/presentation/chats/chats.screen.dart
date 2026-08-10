import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/core/theme/theme.provider.dart';
import 'package:chat_app/core/widgets/inputs/app_text_field.widget.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:chat_app/features/domain/models/user_profile/user_profile.model.dart';
import 'package:chat_app/features/presentation/chats/components/default_story_avatar.widget.dart';
import 'package:chat_app/features/presentation/chats/components/story_avatar.widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  List<UserProfile> test = [];

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
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 12,
                  children: [
                    DefaultStoryAvatar(
                      onTap: () async {
                        final id = test.length + 1;
                        final result = await HttpService.instance.get(
                          ApiRoutes.getProfile(id: id),
                          // queries: {
                          //   "id": id
                          // }
                        );

                        setState(() {
                          test.add(UserProfile.fromJson(result['profile']));
                        });

                        print(test);

                        log(result.toString());
                      }
                    ),
                    
                    if(test.isNotEmpty)
                      ...List.generate(
                        test.length, (index){
                          return StoryAvatar(data: test[index]);
                        })
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