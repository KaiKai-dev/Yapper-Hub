import 'package:chat_app/core/routing/routing.provider.dart';
import 'package:chat_app/features/data/provider/theme.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
    final routing = ref.watch(routingProvider);
    final themeData = ref.watch(themeProvider);

    return MaterialApp.router(
      title: "Chat App",
      theme: themeData,
      routerConfig: routing,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   final TextEditingController controller = TextEditingController();

//   void _incrementCounter() async {
//     // setState(() {
//     //   // This call to setState tells the Flutter framework that something has
//     //   // changed in this State, which causes it to rerun the build method below
//     //   // so that the display can reflect the updated values. If we changed
//     //   // _counter without calling setState(), then the build method would not be
//     //   // called again, and so nothing would appear to happen.
//     //   _counter++;
//     // });


//   try {
//     final result = await Dio().post(
//       'http://192.168.1.7:8000/api/message',
//       data: {
//         'receiverId': 9,
//         'senderId': 10,
//         'message': controller.value.text
//       }
//     );
//     print(result.data);
//   } catch (e) {
//     log(e.toString());
//   }

//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: .center,
//           children: [
//             const Text('Write your messages'),
//             TextFormField(
//               controller: controller,
//               onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton( 
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(CupertinoIcons.paperplane_fill),
//       ),
//     );
//   }
// }
