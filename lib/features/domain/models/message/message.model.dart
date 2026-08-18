
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.model.freezed.dart';
part 'message.model.g.dart';

@freezed
abstract class Message with _$Message {

  const factory Message({
    required int id,
    @JsonKey(name: "conversation_id") required int conversationId,
    @JsonKey(name: "user_id") required int senderId,
    required String body, 
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

}