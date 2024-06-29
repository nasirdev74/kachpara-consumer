import 'dart:math';

class RandomNumber {
  static int generate() {
    var rng = Random();
    return rng.nextInt(900000) + 100000;
  }
}
