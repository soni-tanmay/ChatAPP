import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../utilities/export.dart';

class SocketService {
   SocketService._();
  static  SocketService instance = SocketService._();
  factory() => instance;

   late IO.Socket socket;
  void connect() {
    socket = IO.io(
      'http://15.206.149.143:3000/',
      IO.OptionBuilder()
          .setTransports(<String>['websocket'])
          .setQuery(<String, dynamic>{'token': ''})
          .disableAutoConnect()
          .build(),
    );

    socket.connect();
    socket.onConnect((_) {
      Console.log('Socket Connected on URL :http://15.206.149.143:3000/');
    });
  }

  void disconnect() => socket.disconnect();
}
