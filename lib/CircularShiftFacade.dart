import 'package:kwic_app/CircularShift.dart';

class CircularShiftFacade {
  late CircularShift circularShift;

  CircularShiftFacade(circularShift);

  String performCircularShift(List<String> arr, int shift) {
    String res = '';
    res = circularShift.circularShift(arr, shift);
    return res;
  }
}
