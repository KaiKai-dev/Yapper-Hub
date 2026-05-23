import 'dart:developer';

import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/auth/domain/models/date.data.model/date.data.model.dart';
import 'package:chat_app/features/auth/domain/models/signup.data.model/signup.data.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupNotifier extends Notifier<SignupDataModel> {
  @override
  SignupDataModel build() => SignupDataModel.initial();

  void updateBirthdateTo(DateDataModel value) {
    state = state.copyWith(birthdate: value);
  }

  Future<void> validatePage({
    Function? ifValid,
    Function? onSubmit,
  }) async {
    final formKey = switch(state.currentPage){
      0 => state.nameFormKey,
      1 => state.birthdayFormKey,
      2 => state.credentialsFormKey,
      _ => throw UnimplementedError("Unknown page ${state.currentPage}")
    };
    
    if(!formKey!.currentState!.validate()) return;

    if(state.currentPage < 2) {
      ifValid!(); 
      return;
    }
    log('Logging In');
    onSubmit!();
  }

  void nextPage() {
    state = state.copyWith(currentPage: state.currentPage + 1);
  }

  void previousPage() {
    state = state.copyWith(currentPage: state.currentPage - 1);
  }

  void submit() async {
    final result = HttpService.post(
      '/auth/signup',
      data: SignupDataModel.dummyData(),
      // data: state.toMap(),
    );
  }

  /// UTILITY FUNCTIONS
  /// 
  /// 
  bool isPageFilledUp(int page) {
    return switch (page) {
      0 => [
        state.firstname,
        state.lastname,
      ].every((item) => item!.value.text != ""),

      1 => state.birthdate != null,

      2 => [
        state.email, 
        state.password
      ].every((item) => item!.value.text != ""),

      /// Add cases in case another page is added

      _ => true,
    };
  }

  bool get hasChanges {
    final toChecks = [
      state.firstname,
      state.lastname,
      state.birthdate,
      state.email,
      state.password,
    ];
    bool result = false;

    for (var element in toChecks) {
      if(switch (element) {
        TextEditingController(: var value) => value.text != '',
        DateDataModel() => element != DateDataModel.initial(),
        _ => false,
      }) {
        result = true;
        break;
      }
    }

    return result;
  }
}

final signupProvider = NotifierProvider.autoDispose<SignupNotifier, SignupDataModel>(
  SignupNotifier.new,
);
