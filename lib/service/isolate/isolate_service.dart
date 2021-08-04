import 'dart:isolate';
import 'package:flutter/cupertino.dart';

SendPort? newIsolateSendPort;

Isolate? newIsolate;

createIsolate() async {
  ReceivePort receivePort = ReceivePort();
  newIsolate = await Isolate.spawn(_callback, receivePort.sendPort);
  newIsolateSendPort = await receivePort.first;
}

_callback(SendPort sendPort) {
  ReceivePort newIsolateReceivePort = ReceivePort();
  sendPort.send(newIsolateReceivePort.sendPort);
  newIsolateReceivePort.listen((message) {
    SpawnMessageProtocol protocol = message as SpawnMessageProtocol;
    dynamic data = protocol.data;
    // deal data
    dynamic newData = 'deal $data}';
    protocol?.sendPort?.send(newData);
  });
}

/// 向新的isolate发送消息并接收回复
Future sendReceive(dynamic message) async {
  ReceivePort receivePort = ReceivePort();
  newIsolateSendPort?.send(SpawnMessageProtocol(
    sendPort: receivePort.sendPort,
    data: message,
  ));
  return receivePort.first;
}

dispose() {
  newIsolate?.kill(priority: Isolate.immediate);
  newIsolate = null;
}

class SpawnMessageProtocol<T> {
  final SendPort? sendPort;
  final T? data;

  SpawnMessageProtocol({@required this.sendPort, this.data});
}