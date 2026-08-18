import 'package:chat_app/features/domain/models/user_profile/user_profile.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.model.freezed.dart';
part 'auth_data.model.g.dart';

@freezed
abstract class AuthData with _$AuthData {
  factory AuthData({
    @JsonKey(name: 'user') required UserProfile user,
    @JsonKey(name: 'bearer') String? token,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
}