import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.model.freezed.dart';
part 'user_profile.model.g.dart';


@freezed
abstract class UserProfile with _$UserProfile {
  factory UserProfile({
    required int id,
    required String firstname,
    required String lastname,
    @JsonKey(name: "avatar_url") String? avatarUrl,
    String? bio,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}