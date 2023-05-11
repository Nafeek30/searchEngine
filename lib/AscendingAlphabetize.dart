import 'package:kwic_app/AlphabetizeBridge.dart';

class AscendingAlphabetize extends AlphabetizeBridge {
  /// This function sorts all the lines in alphabetical order

  @override
  alphabetizeLinesImp(List sortedShifts) {
    sortedShifts.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }
}
