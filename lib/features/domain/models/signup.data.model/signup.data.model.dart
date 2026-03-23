
import 'package:chat_app/features/domain/models/date.data.model/date.data.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "signup.data.model.freezed.dart";

@freezed
abstract class SignupDataModel with _$SignupDataModel {
  const factory SignupDataModel({
    String? firstname,
    String? lastname,
    DateDataModel? birthdate,
    String? email,
    String? password,
  }) = _SignupDataModel;
}