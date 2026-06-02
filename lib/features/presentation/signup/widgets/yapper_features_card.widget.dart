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
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        border: Border.all(
          width: .2,
          color: theme.colorScheme.onSurfaceVariant,
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
            style: theme.textTheme.displaySmall!.copyWith(
              fontWeight: .w800,
              fontSize: 16
            ),
          ),
          Text(
            message,
            style: theme.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}