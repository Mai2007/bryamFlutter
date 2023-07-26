import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier {
  //Variables
  int counter1 = 0;
  int counter2 = 100;
  //Funciones/Metodos

  void addCounter1() {
    counter1++;
    notify();
  }

  void removeCounter2() {
    counter2--;
    notify();
  }
}
