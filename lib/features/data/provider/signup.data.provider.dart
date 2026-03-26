import 'dart:developer';

import 'package:chat_app/features/domain/models/signup.data.model/signup.data.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupNotifier extends Notifier<SignupDataModel> {
  @override
  SignupDataModel build() => SignupDataModel.initial();

  // void updateNameData({required String firstname, required String lastname}) {
  //   state = state.copyWith(firstname: firstname, lastname: lastname);
  // }

  // void updateBirthdate({required DateDataModel birthdate}) {
  //   state = state.copyWith(birthdate: birthdate);
  // }

  // void updateCredentials({required String email, required String password}) {
  //   state = state.copyWith(email: email, password: password);
  // }

  Future<void> validatePage({
    required int currentPage,
    Function? ifValid,
  }) async {
    final formKey = switch(currentPage){
      0 => state.nameFormKey,
      1 => state.birthdayFormKey,
      2 => state.credentialsFormKey,
      _ => throw UnimplementedError("Unknown page $currentPage")
    };

    if(formKey!.currentState!.validate()) {
      ifValid!();
    }
  }

  void nextPage() {
    state = state.copyWith(currentPage: state.currentPage + 1);
  }

  void previousPage() {
    state = state.copyWith(currentPage: state.currentPage - 1);
  }

  bool isPageFilledUp(int page) {
    return switch (page) {
      0 => [state.firstname, state.lastname].every((item) => item!.value.text != ""),

      1 => state.birthdate != null,

      2 => [state.email, state.password].every((item) => item!.value.text != ""),

      _ => throw UnimplementedError(
        "Onboarding step $page is not implemented yet",
      ),
    };
  }
}

final signupNotifier = NotifierProvider.autoDispose<SignupNotifier, SignupDataModel>(
  SignupNotifier.new,
);
