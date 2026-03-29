import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final T initialValue;
  final bool stretch;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final ValueChanged onSelected;
  final String? title;
  final TextStyle? titleStyle;
  final TextEditingController? controller;
  final MenuController? menuController;

  const AppDropdown({
    super.key,
    required this.initialValue,
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.title,
    this.titleStyle,
    this.controller,
    this.menuController,
    this.stretch = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 12,
      crossAxisAlignment: .start,
      children: [
        if(title != null) Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title!,
            style: titleStyle ?? theme.textTheme.labelMedium,
          ),
        ),
        DropdownMenu<T>(
          initialSelection: initialValue,
          controller: controller,
          menuController: MenuController(),
          width: stretch 
            ? double.infinity 
            : null,
          inputDecorationTheme: theme.inputDecorationTheme, 
          menuStyle: theme.menuTheme.style,
          dropdownMenuEntries: dropdownMenuEntries,
          onSelected: onSelected,
        ),
      ],
    );
  }
}