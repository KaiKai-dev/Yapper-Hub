String? requiredField(String? value) {
    if(value == "" || value == null) {
      return "This field is required";
    }

    return null;
}

String? confirmPassword(String? value, String password, {
  bool required = false
}) {
  if(requiredField(value) != null && required){
    return requiredField(value)!;
  }

  if(value != password) return "Password doesn't match";

  return '';
}

String? validatePassword(String? value) {
  if(value == "" || value == null) return "This field is required";

  List<String> messages = [];

  if(value.length < 8) {
    messages.add('at least 8 characters');
  } 
  if (value.length > 15) {
    messages.add('not more than 15 charcters');
  } 
  if(!RegExp(r'[A-Z]').hasMatch(value)) {
     messages.add('at least one uppercase character');
  } 
  if(!RegExp(r'[a-z]').hasMatch(value)) {
     messages.add('at least one uppercase character');
  } 
  if(!RegExp(r'[0-9]').hasMatch(value)) {
    messages.add('at least one number');
  } 
  if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)){
    messages.add('at least one special characters');
  }

  print(messages);

  // if(value.contains(RegExp(source)))
  if(messages.isEmpty) return null;
  
  messages = ["Password must have:", ...messages];
  return messages.join('\n');

}