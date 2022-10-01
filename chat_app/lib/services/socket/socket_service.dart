import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../utilities/export.dart';

class SocketService {
   SocketService._();
  static  SocketService instance = SocketService._();
  factory() => instance;

   late IO.Socket socket;
  void connect() {
    socket = IO.io(
      'http://localhost:3000/',
      IO.OptionBuilder()
          .setTransports(<String>['websocket'])
          .setQuery(<String, dynamic>{'token': ''})
          .disableAutoConnect()
          .build(),
    );

    socket.connect();
    socket.onConnect((_) {
      Console.log('Socket Connected on URL : http://localhost:3000/');
      socket.on('c05bc5bd-598e-4230-85c3-36b49cc3e1ef', (data) {
        Console.log(data);
      });
    });
  }

  void disconnect() => socket.disconnect();
}
