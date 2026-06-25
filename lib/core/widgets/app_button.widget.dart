import 'package:chat_app/core/widgets/enums/app_button_styles.dart';
import 'package:chat_app/features/domain/extensions/build_context.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final String title;
  final VoidCallback? onPressed;
  final AppButtonStyle _style; 
  final IconData? icon;
  final bool disabled;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.primary;

  const AppButton.primary({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.primary;

  const AppButton.secondary({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.secondary;


  const AppButton.tertiary({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.tertiary;


  const AppButton.neutral({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.neutral;

  const AppButton.surface({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disabled = false,
  }) : _style = AppButtonStyle.surface;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    final backgroundColor = switch(_style){
      AppButtonStyle.primary => colorScheme.primary,
      AppButtonStyle.secondary => colorScheme.secondary,
      AppButtonStyle.tertiary=> colorScheme.tertiary,
      AppButtonStyle.neutral => colorScheme.surfaceContainer,
      AppButtonStyle.surface => colorScheme.surface,
    };

    final foregroundColor = switch(_style){
      AppButtonStyle.primary => colorScheme.onPrimary,
      AppButtonStyle.secondary => colorScheme.onSecondary,
      AppButtonStyle.tertiary=> colorScheme.onTertiary,
      AppButtonStyle.neutral => colorScheme.onSurfaceVariant,
      AppButtonStyle.surface => colorScheme.onSurface
    };

    final side = switch(_style) {
      AppButtonStyle.neutral => BorderSide(
        width: .5,
        color: colorScheme.brightness == Brightness.light 
          ? colorScheme.surfaceDim
          : colorScheme.surface
      ),

      _ => null
    };
    

    return FilledButton(
      onPressed: disabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: context.theme.textTheme.labelLarge,
        side: side,
      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 12,
        children: [
          Visibility(
            visible: icon != null,
            child: Icon(
              icon
            ),
          ),
          Text(
            title
          )
        ],
      )
    );
    
    
  }
}