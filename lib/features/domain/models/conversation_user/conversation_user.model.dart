

import 'package:chat_app/features/domain/enums/conversation_role.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_user.model.freezed.dart';
part 'conversation_user.model.g.dart';

@freezed
abstract class ConversationUser with _$ConversationUser {
  const factory ConversationUser({
    required int id,
    @JsonKey(name: "user_id") required userId,
    @JsonKey(name: "conversation_id") required int conversationId,
    @Default(ConversationRole.member) ConversationRole? role,
    @JsonKey(name: "last_read_at") required String? lastRead,
    @JsonKey(name: "is_muted") @Default(false) bool muted,

  }) = _ConversationUser;

  factory ConversationUser.fromJson(Map<String, dynamic> json) => _$ConversationUserFromJson(json);
}