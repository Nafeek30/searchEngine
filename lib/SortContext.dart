import 'package:kwic_app/AscendingAlphabetize.dart';
import 'package:kwic_app/SortStrategy.dart';

class SortContext {
  late SortStrategy strategy;
  AscendingAlphabetize alphabetize = AscendingAlphabetize();

  SortContext(strategy);

  sort(List sortedShifts) {
    return strategy.sortLines(sortedShifts);
  }
}
