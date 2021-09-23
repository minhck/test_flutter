import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('_MyHomePageState');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      body: MyCenterWidget(
        counter: _counter,
        key: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key? key,
    required this.counter,
  }) : super(key: key);

  // data này vô nghĩa vì đúng bản chất thì MyCenterWidget ko cần nó
  final int counter;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('MyCenterWidget');
    return Center(
      // tiếp tục truyền data từ widget MyCenterWidget xuống MyText
      child: MyText(counter: counter),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.counter}) : super(key: key);

  // chỉ có MyText mới thật sự cần data này
  final int counter;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('MyText');
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}
