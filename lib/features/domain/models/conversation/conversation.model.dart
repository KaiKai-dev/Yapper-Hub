
import 'package:chat_app/features/domain/models/conversation_user/conversation_user.model.dart';
import 'package:chat_app/features/domain/models/message/message.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.model.freezed.dart';
part 'conversation.model.g.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required int id,
    List<Message>? messages,
    @JsonKey(name: 'conversation_users') required List<ConversationUser> users,

  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}