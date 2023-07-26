import 'package:flutter/material.dart';
import 'package:prueba_appa/app/presentation/views/counter_view.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void addCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  void lessCounter() {
    if (counter - 1 >= 0) {
      setState(() {
        counter = counter - 1;
      });
    }
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: addCounter,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: lessCounter,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: resetCounter,
            child: const Icon(Icons.refresh),
          )
        ],
      ),
      body: CounterView(counterValue: counter),
    );
  }
}
