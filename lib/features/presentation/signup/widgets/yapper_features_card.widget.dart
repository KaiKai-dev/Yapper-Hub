import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';

class YapperFeaturesCard extends StatelessWidget {
  final String title;
  final String message;
  final Widget icon;
  const YapperFeaturesCard({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
     
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceContainer,
        border: Border.all(
          width: .2,
          color: context.theme.colorScheme.onSurfaceVariant,
        ),
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          icon,
          Text(
            title,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontWeight: .w800,
              fontSize: 16
            ),
          ),
          Text(
            message,
            style: context.theme.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}