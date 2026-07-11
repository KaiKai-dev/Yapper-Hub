
import 'package:chat_app/features/data/converters/string_to_date.converter.dart';
import 'package:chat_app/features/domain/models/conversation_user/conversation_user.model.dart';
import 'package:chat_app/features/domain/models/date_data/date_data.model.dart';
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
    @StringToDateConverter() @JsonKey(name: "last_read") DateDataModel? lastRead,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}