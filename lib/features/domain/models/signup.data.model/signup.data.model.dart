
import 'package:chat_app/features/domain/models/date.data.model/date.data.model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "signup.data.model.freezed.dart";

@freezed
abstract class SignupDataModel with _$SignupDataModel {
  const factory SignupDataModel({
    TextEditingController? firstname,
    TextEditingController? lastname,
    DateDataModel? birthdate,
    TextEditingController? email,
    TextEditingController? password,

    GlobalKey<FormState>? nameFormKey,
    GlobalKey<FormState>? birthdayFormKey,
    GlobalKey<FormState>? credentialsFormKey,
  }) = _SignupDataModel;

  factory SignupDataModel.initial() => SignupDataModel(
    firstname: TextEditingController(),
    lastname: TextEditingController(),
    email: TextEditingController(),
    password: TextEditingController(),

    nameFormKey: GlobalKey<FormState>(),
    birthdayFormKey: GlobalKey<FormState>(),
    credentialsFormKey: GlobalKey<FormState>(),
  );
}