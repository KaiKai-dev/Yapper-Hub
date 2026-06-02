import 'package:chat_app/core/providers/theme.provider.dart';
import 'package:chat_app/core/routing/routing.library.dart';
import 'package:chat_app/features/data/services/routing.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  RoutingService.instance.init();

  runApp(
    ProviderScope(
      child: ChatApp()
    )
  );
}

class ChatApp extends ConsumerStatefulWidget {
  const ChatApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatAppState();
}

class _ChatAppState extends ConsumerState<ChatApp> {

  @override
  void initState() {
    ref.read(themeProvider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final routing = ref.watch(routingProvider);
    final themeData = ref.watch(themeProvider);

    return MaterialApp.router( 
      title: "Chat App",
      theme: themeData,
      routerConfig: RoutingService.instance.router,
    );
  }
}
