import 'dart:math';

class Solve {
  static (double?, double?)? solve(double a, double b, double c) {
    if (a == 0) {
      if (b == 0) {
        return (null);
      }
      if (c == 0) {
        return (null, null);
      }
      return (-c / b, null);
    }
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      return (null);
    }
    if (delta == 0) {
      return (-b / (2 * a), null);
    }
    return ((-b - sqrt(delta) / (2 * a)), (-b + sqrt(delta) / (2 * a)));
  }
}
