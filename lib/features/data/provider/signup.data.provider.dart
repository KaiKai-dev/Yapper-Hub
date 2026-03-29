import 'dart:developer';

import 'package:chat_app/features/domain/models/signup.data.model/signup.data.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupNotifier extends Notifier<SignupDataModel> {
  @override
  SignupDataModel build() => SignupDataModel.initial();

  void updateBirthdate({
    String? month,
    int? year,
    int? date,
  }) {
    state = state.copyWith(birthdate: state.birthdate!.copyWith(
      date: date,
      year: year,
      month: month,
    ));
  }

  Future<void> validatePage({
    Function? ifValid,
  }) async {
    final formKey = switch(state.currentPage){
      0 => state.nameFormKey,
      1 => state.birthdayFormKey,
      2 => state.credentialsFormKey,
      _ => throw UnimplementedError("Unknown page ${state.currentPage}")
    };
    log("${formKey!.currentState!.validate()}");
    if(formKey.currentState!.validate()) {
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

final signupProvider = NotifierProvider.autoDispose<SignupNotifier, SignupDataModel>(
  SignupNotifier.new,
);
