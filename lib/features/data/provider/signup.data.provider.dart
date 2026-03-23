import 'package:chat_app/features/domain/models/date.data.model/date.data.model.dart';
import 'package:chat_app/features/domain/models/signup.data.model/signup.data.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupNotifier extends Notifier<SignupDataModel> {
  @override
  SignupDataModel build() => SignupDataModel();

  void updateNameData({required String firstname, required String lastname}) {
    state = state.copyWith(firstname: firstname, lastname: lastname);
  }

  void updateBirthdate({required DateDataModel birthdate}) {
    state = state.copyWith(birthdate: birthdate);
  }

  void updateCredentials({required String email, required String password}) {
    state = state.copyWith(email: email, password: password);
  }
}

final signupNotifier = NotifierProvider<SignupNotifier, SignupDataModel>(
  SignupNotifier.new,
);
