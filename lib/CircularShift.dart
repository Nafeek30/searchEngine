class CircularShift {
  List<String> noiseWords = [
    'a',
    'an',
    'the',
    'and',
    'or',
    'of',
    'to',
    'be',
    'is',
    'in',
    'out',
    'by',
    'as',
    'at',
    'off',
  ];

  /// Circular shifts to the left by one word each time
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

  /// Omits the sentences that start with a noise word
  omitNoise(List list) {
    for (int i = 0; i < list.length; i++) {
      if (noiseWords.contains(list[i].split(' ').first)) {
        list.removeAt(i);
      }
    }
  }
}
