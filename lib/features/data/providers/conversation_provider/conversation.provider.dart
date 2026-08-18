
import 'package:chat_app/features/data/services/conversation/conversation.service.dart';
import 'package:chat_app/features/domain/models/conversation/conversation.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation.provider.g.dart';

@Riverpod(keepAlive: true)
class ConversationProvider extends _$ConversationProvider {
  @override
  List<Conversation>? build() => null;

  void getConversations() async {
    final service = conversationService(ref);

    // final result = await service.getConversations();

    // state = result;
  }
}