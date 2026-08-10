import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:chat_app/features/domain/models/user_profile/user_profile.model.dart';
import 'package:chat_app/features/presentation/chats/components/avatar_frame.widget.dart';
import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final UserProfile data;
  const StoryAvatar({
    required this.data,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 12,
      children: [
        AvatarFrame(url: data.avatarUrl!, size: 60,),
        Text(
          data.firstname,
          style: context.theme.textTheme.bodySmall,
        )
      ]
    );
  }
}