import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../utilities/export.dart';

class SocketService {
  const SocketService._();
  static const SocketService _instance = SocketService._();
  factory() => _instance;

  static late IO.Socket socket;
  void connnect() {
    socket = IO.io(
      '',
      IO.OptionBuilder()
          .setTransports(<String>['websocket'])
          .setQuery(<String, dynamic>{'token': ''})
          .disableAutoConnect()
          .build(),
    );

    socket.connect();
    socket.onConnect((_) => Console.log('Socket Connected on URL : '));
  }

  void disconnect() => socket.disconnect();
}
