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

  omitNoise(List<String> list) {
    for (int i = 0; i < list.length; i++) {
      if (noiseWords.contains(list[i].split(' ').first)) {
        list.removeAt(i);
      }
    }
  }
}

// class CircularShift {
//
//   void shiftLeft(List<String> words) {
//     String firstWord = words.removeAt(0);
//     words.add(firstWord);
//     print('1');
//     print(words);
//   }
//
//   void sortWords(List<String> words) {
//     words.sort();
//     print('2');
//     print(words);
//   }
//
//   String getShiftedSentence(List<String> words) {
//     return words.join(" ");
//   }
// }
