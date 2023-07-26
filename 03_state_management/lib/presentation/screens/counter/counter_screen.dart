import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:state_management/presentation/screens/counter/controllers/counter_controller.dart';

final counterProvider =
    SimpleProvider<CounterController>((ref) => CounterController());

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final counter1 = ref
                    .watch(counterProvider
                        .select((controller) => controller.counter1))
                    .counter1;

                return Text("counter1 : $counter1");
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final counter2 = ref
                    .watch(counterProvider
                        .select((controller) => controller.counter2))
                    .counter2;
                return Text("counter2 : $counter2");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {
              counterProvider.read.addCounter1();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "remove",
            onPressed: () {
              counterProvider.read.removeCounter2();
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
