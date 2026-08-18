import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/domain/models/conversation/conversation.model.dart';
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
                onTap: fetchConversations
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

  void fetchUserProfiles () async {
    log(ApiRoutes.getProfile());
    final result = await HttpService.instance.get(
      ApiRoutes.getProfile(),
      // queries: {
      //   "id": id
      // }
    );

    List<dynamic> profilesResult = result["profiles"];
    List<UserProfile> profiles = profilesResult.map((e) => UserProfile.fromJson(e),).toList();

    setState(() {
      test = profiles;
    });

    print(test);

    log(result.toString());
  }

  void fetchConversations() async {
    final result = await HttpService.instance.get(
      ApiRoutes.fetchConversations,
      queries: {
        "per_page": 1,
        "sort": "asc"
      }
    );

    final conversationsData = result["conversations"]["data"] as List;
    log(conversationsData.toString());

    final conversations = conversationsData.map(
      (json) => Conversation.fromJson(json as Map<String, dynamic>)
    ).toList();

    log(conversations.runtimeType.toString());
  }
}