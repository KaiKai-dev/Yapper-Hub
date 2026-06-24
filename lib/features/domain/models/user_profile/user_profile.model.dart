
import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'user_profile.model.freezed.dart';
part 'user_profile.model.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  factory UserProfile({
    required String firstname,
    required String lastname
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}