import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/domain/models/user_profile/user_profile.model.dart';
import 'package:chat_app/features/presentation/chats/components/default_story_avatar.widget.dart';
import 'package:chat_app/features/presentation/chats/components/story_avatar.widget.dart';
import 'package:flutter/material.dart';

class StoriesSection extends StatefulWidget {
  const StoriesSection({super.key});

  @override
  State<StoriesSection> createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {
  List<UserProfile> test = [];
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        ),
      ),
    );
  }
}