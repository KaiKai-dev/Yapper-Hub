import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/domain/enums/sort.dart';
import 'package:chat_app/features/domain/models/conversation/conversation.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation.service.g.dart';

@riverpod
ConversationService conversationService(Ref ref) => ConversationService(ref);

class ConversationService {
  final Ref _ref;
  ConversationService(this._ref);

  void getConversations() async {
    final user = _ref.read(authProvider);

    final result = await HttpService.instance.get(
      ApiRoutes.fetchConversations,
      queries: {
        "per_page": 10,
        "sort": Sort.descending.abbr
      }
    );

    final conversationData = result["conversations"];
  }
}
