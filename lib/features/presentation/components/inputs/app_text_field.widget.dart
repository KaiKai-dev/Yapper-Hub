import 'package:chat_app/features/domain/enums/input_type.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final InputType type;
  final Validator? validator;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.type = InputType.text,
    this.validator, 
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label!,
              style: textTheme.labelMedium!
                .copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: type == InputType.password,
          keyboardType: type.type,
          inputFormatters: type.formatter,
          onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: onChanged,
          autovalidateMode: .onUserInteraction,
          validator: validator != null
            ? (value) => validator!.run(value)
            : null,
        ),
      ],
    );
  }
  
}