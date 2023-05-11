import 'package:kwic_app/AscendingAlphabetize.dart';
import 'package:kwic_app/SortStrategy.dart';

class SortContext {
  late SortStrategy strategy;
  late AscendingAlphabetize alphabetize = AscendingAlphabetize();

  SortContext(strategy);

  alphabetizeLines(List sortedShifts) {
    return alphabetize.alphabetizeLinesImp(sortedShifts);
  }

  sort(List sortedShifts) {
    return strategy.sortLines(sortedShifts);
  }
}
