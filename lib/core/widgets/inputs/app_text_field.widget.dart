import 'package:chat_app/core/widgets/enums/input_type.dart';
import 'package:chat_app/features/domain/enums/validator.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final InputType type;
  final Validator? validator;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? counter;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.type = InputType.text,
    this.validator, 
    this.onChanged,
    this.prefix,
    this.suffix,
    this.counter,
  });

  const AppTextField.required({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.type = InputType.text,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.counter,
  }) : validator = Validator.required;

  const AppTextField.requiredWithLength({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.type = InputType.text,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.counter,
  }) : validator = Validator.requiredWithMaxMinLength;

  const AppTextField.password({
    super.key,
    this.controller,
    this.label = "Password",
    this.hintText = '********',
    this.onChanged,
    this.prefix,
    this.suffix,
    this.counter,
  }): type = InputType.password,
      validator = Validator.password;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscured;

  @override
  void initState() {
    super.initState();
    obscured = widget.type == InputType.password;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if(widget.label != null) 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.label!,
              style: textTheme.labelMedium!
                .copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        TextFormField(
          controller: widget.controller,
          obscureText: obscured,
          keyboardType: widget.type.type,
          inputFormatters: widget.type.formatter,
          onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefix: widget.prefix,
            suffixIcon: widget.type != InputType.password
              ? widget.suffix
              : GestureDetector(
                  onTap: () => setState(() {
                    obscured = !obscured;
                  }),
                  child: Icon(
                    switch(obscured){
                      true => Icons.visibility_off,
                      false => Icons.visibility
                    },
                    size: 20,
                  ),
                ),
            counter: widget.counter
          ),
          textAlignVertical: .center,
          onChanged: widget.onChanged,
          autovalidateMode: .onUserInteraction,
          validator: widget.validator != null
            ? (value) => widget.validator!.run(value)
            : null,
        ),
      ],
    );
  }


}