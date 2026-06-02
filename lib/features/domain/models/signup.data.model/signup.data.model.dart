
import 'package:chat_app/core/constants/months.dart';
import 'package:chat_app/features/domain/models/date.data.model/date.data.model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part "signup.data.model.freezed.dart";

@freezed
abstract class SignupDataModel with _$SignupDataModel {
  const SignupDataModel._();
  
  factory SignupDataModel({
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
    birthdate: DateDataModel.initial(),
    nameFormKey: GlobalKey<FormState>(),
    birthdayFormKey: GlobalKey<FormState>(),
    credentialsFormKey: GlobalKey<FormState>(),
  );

  Map<String, dynamic> toMap() {
    final birthdata = DateTime(
      birthdate!.year!,
      months.indexOf(birthdate!.month!) + 1,
      birthdate!.date!
    );
    final formattedBirthdate = DateFormat('yyyy-MM-dd').format(birthdata);

    return {
      "firstname": firstname!.value.text,
      "lastname": lastname!.value.text,
      'email': email!.value.text,
      'password': password!.value.text,
      "birthdate": formattedBirthdate,
    };
  }

  static Map<String, dynamic> dummyData() {
    return {
      "firstname": "Jems",
      "lastname": "Yep",
      'email': "jems.yap@gmail.com",
      "password": "P@ssword017",
      "birthdate": DateFormat('yyyy-MM-dd').format(DateTime.now())
    };
  }
}