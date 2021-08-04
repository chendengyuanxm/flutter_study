import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:isolate/isolate.dart';
import 'package:isolate/isolate.dart';

class IsolateTestVM {

  newIsolate() async {
    ReceivePort receivePort = ReceivePort();
    Isolate? isolate;

    try {
      isolate = await Isolate.spawn<SpawnMessageProtocol>(_methodRunAnotherIsolate, SpawnMessageProtocol(receivePort.sendPort, 'param'));

      receivePort.listen((message) {
        print('[receive] ${message.toString()}');
      });

      Isolate.current.controlPort.send('xxxxx');
    } catch (e) {
      print('[error] $e');
    } finally {
      isolate?.addOnExitListener(receivePort.sendPort, response: 'isolate has been killed');
    }

    // isolate?.kill();
  }

  static void _methodRunAnotherIsolate(SpawnMessageProtocol message) {
    SendPort sendPort = message.sendPort;
    sendPort.send('Isolate Created!');
  }

  runComputeIsolate() async {
    int i = await compute(_doSomething, 8);
    print(i);
  }

  static int _doSomething(int i) {
    return i + 1;
  }

  Future<LoadBalancer> loadBalancer = LoadBalancer.create(2, IsolateRunner.spawn);

  Future<int> useLoadBalancer() async {
    final lb = await loadBalancer;
    int res = await lb.run<int, int>(_doSomething, 1);
    return res;
  }
}

class SpawnMessageProtocol {
  final SendPort sendPort;
  final String url;

  SpawnMessageProtocol(this.sendPort, this.url);
}

