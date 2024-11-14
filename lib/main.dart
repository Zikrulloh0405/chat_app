// import 'package:chat_app/pages/home_page.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Localhost for Android - 10.0.2.2
  // Localhost for iOS - 127.0.0.1
  final IOWebSocketChannel channel =
  IOWebSocketChannel.connect('ws://127.0.0.1:8080');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('No connection');
            case ConnectionState.waiting:
              return Text('Connecting...');
            case ConnectionState.active:
              return Center(child: Text('${snapshot.data}'));
            case ConnectionState.done:
              return Text('${snapshot.data} (closed)');
          }
        },
      ),
    );
  }
}

