import 'package:kwic_app/ISort.dart';

class Sort implements ISort {
  List allNumberSentences =
      []; // contains a list of a list of numbers converted from char
  List<String> sentences =
      []; // contains the final sorted list of sentences reverse converted from numerals
  var numerals = {
    ' ': 0,
    'a': 1,
    'A': 2,
    'b': 3,
    'B': 4,
    'c': 5,
    'C': 6,
    'd': 7,
    'D': 8,
    'e': 9,
    'E': 10,
    'f': 11,
    'F': 12,
    'g': 13,
    'G': 14,
    'h': 15,
    'H': 16,
    'i': 17,
    'I': 18,
    'j': 19,
    'J': 20,
    'k': 21,
    'K': 22,
    'l': 23,
    'L': 24,
    'm': 25,
    'M': 26,
    'n': 27,
    'N': 28,
    'o': 29,
    'O': 30,
    'p': 31,
    'P': 32,
    'q': 33,
    'Q': 34,
    'r': 35,
    'R': 36,
    's': 37,
    'S': 38,
    't': 39,
    'T': 40,
    'u': 41,
    'U': 42,
    'v': 43,
    'V': 44,
    'w': 45,
    'W': 46,
    'x': 47,
    'X': 48,
    'y': 49,
    'Y': 50,
    'z': 51,
    'Z': 52,
  }; // map of each character with a corresponding number value

  /// Converts chars to integers using the [numerals] map and [sortedShifts] param
  convertToNumerals(List sortedShifts) {
    for (String sentence in sortedShifts) {
      List sentenceValues = [];

      for (int i = 0; i < sentence.length; i++) {
        String letter = sentence[i];
        if (numerals.containsKey(letter)) {
          sentenceValues.add(numerals[letter]);
        }
      }
      allNumberSentences.add(sentenceValues);
    }
  }

  /// Converts integers to chars using the [numerals] map
  convertToChars(List sortedShifts) {
    List allCharSentences = [];
    // Reverse the initial map to change [key:value] to [value:key] format
    var reversed =
        Map.fromEntries(numerals.entries.map((e) => MapEntry(e.value, e.key)));

    /// Convert to chars
    for (List innerList in sortedShifts) {
      List convertedInnerList = [];
      for (int number in innerList) {
        convertedInnerList.add(reversed[number]);
      }
      allCharSentences.add(convertedInnerList);
    }

    for (List innerList in allCharSentences) {
      String sentence = innerList.join('');
      sentences.add(sentence);
    }
  }

  /// This function cleans up old memory
  void cleanup() {
    allNumberSentences.clear();
    sentences.clear();
  }

  /// This function sorts all the lower and upper case letters according to the assignment requirements
  @override
  sortLines(List sortedShifts) {
    // First convert the list of sentences to numeric values
    convertToNumerals(sortedShifts);

    // Perform sort on numeric values to sort all list of numerals
    // by their corresponding index value in ascending order
    for (int i = 0; i < allNumberSentences.length; i++) {
      for (int j = i + 1; j < allNumberSentences.length; j++) {
        bool swapNeeded = false;
        for (int k = 0; k < allNumberSentences[i].length; k++) {
          if (allNumberSentences[i][k] > allNumberSentences[j][k]) {
            swapNeeded = true;
            break;
          } else if (allNumberSentences[i][k] < allNumberSentences[j][k]) {
            break;
          }
        }
        if (swapNeeded) {
          List temp = allNumberSentences[i];
          allNumberSentences[i] = allNumberSentences[j];
          allNumberSentences[j] = temp;
        }
      }
    }

    // Convert the sorted list of list of numeric values back to chars and create sentences
    convertToChars(allNumberSentences);

    // Replace the original input list to the sorted list of sentences
    sortedShifts.replaceRange(0, sortedShifts.length, sentences);

    // Clear the initial lists
    cleanup();
  }
}
