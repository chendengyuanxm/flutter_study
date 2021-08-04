import 'package:flutter/material.dart';
import 'package:flutterstudy/vm/isolate_test_vm.dart';

class IsolateTestPage extends StatefulWidget {
  const IsolateTestPage({Key? key}) : super(key: key);

  @override
  _IsolateTestPageState createState() => _IsolateTestPageState();
}

class _IsolateTestPageState extends State<IsolateTestPage> {

  IsolateTestVM vm = IsolateTestVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IsolateTest'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: vm.newIsolate,
              child: Text('IsolateTest'),
            ),
            ElevatedButton(
              onPressed: vm.runComputeIsolate,
              child: Text('runComputeIsolate'),
            ),
            ElevatedButton(
              onPressed: vm.useLoadBalancer,
              child: Text('useLoadBalancer'),
            ),
          ],
        ),
      ),
    );
  }
}
