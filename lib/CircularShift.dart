class CircularShift {
  /// Circular shifts to the left
  String circularShift(List<String> arr, int shift) {
    int length = arr.length;
    List<String> result =
        List<String>.generate(length, (index) => arr[(index + shift) % length]);

    String res = '';
    result.forEach((element) {
      res += '$element ';
    });

    return res;
  }
}
