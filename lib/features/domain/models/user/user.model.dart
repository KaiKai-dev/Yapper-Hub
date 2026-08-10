
import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    required String firstname,
    required String lastname
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}