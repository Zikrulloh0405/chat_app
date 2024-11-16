import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:l/l.dart';

class WebSocketServer extends StatelessWidget {
  const WebSocketServer({
    super.key,
    required this.channel,
  });

  final IOWebSocketChannel channel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        l.i("Stream Status : ${snapshot.hasData}");
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            l.i("No connection with web socket");
            return Text('No connection');
          case ConnectionState.waiting:
            l.i("Waiting for connection");
            return Text('Connecting...');
          case ConnectionState.active:
            l.i("Connection is active");
            return HomePage();
          case ConnectionState.done:
            l.e("No connection with web socket");
            return Text('${snapshot.data} (closed)');
        }
      },
    );
  }
}
