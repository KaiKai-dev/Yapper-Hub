import 'package:chat_app/core/utils/validators.dart';

enum Validator {
    required,
    requiredWithMaxMinLength,
    numbersOnly,
    password,
    confirmPassword; 

    String? run(String? value) {
      return switch(this) {
        Validator.required => requiredField(value),
        Validator.password => validatePassword(value),

        // TODO implement other validation types
        _ => requiredField(value)
      };
    }
}