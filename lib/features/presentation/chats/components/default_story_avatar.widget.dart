import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DefaultStoryAvatar extends StatelessWidget {
  final GestureTapCallback? onTap;
  const DefaultStoryAvatar({
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(  
      spacing: 12,
      children: [
        InkWell(
          onTap: onTap,
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
              )
            ),
          ),
        ),

        Text(
          "Your Story",
          style: context.textTheme.bodySmall
        )
      ],
    );
  }
}