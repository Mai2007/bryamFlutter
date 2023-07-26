import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.counterValue});

  final int counterValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("El contador actual es: "),
          Text(
            counterValue.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
