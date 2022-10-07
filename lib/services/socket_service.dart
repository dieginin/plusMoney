import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart';

import 'package:plus_money/global/environment.dart';
import 'package:plus_money/services/services.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  Socket get socket => _socket;
  Function get emit => socket.emit;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = io(
      Environment.socketUrl,
      OptionBuilder().setTransports(['websocket']).enableAutoConnect().enableForceNew().setExtraHeaders({'x-token': token}).build(),
    );

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}
