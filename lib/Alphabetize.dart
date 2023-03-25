import 'package:kwic_app/ISort.dart';

class Alphabetize implements ISort {
  /// This function sorts all the lines in alphabetical order
  @override
  sortLines(List sortedShifts) {
    sortedShifts.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }
}
