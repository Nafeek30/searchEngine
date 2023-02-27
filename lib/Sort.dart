class Sort {
  /// This function sorts all the lower and upper case letters according to the assignment requirements
  sortLines(List<String> sortedShifts) {
    for (int i = 0; i < sortedShifts.length - 1; i++) {
      for (int j = 0; j < sortedShifts.length - i - 1; j++) {
        if (sortedShifts[j].toLowerCase()[0] ==
            sortedShifts[j + 1].toLowerCase()[0]) {
          if (sortedShifts[j][0] == sortedShifts[j][0].toUpperCase() &&
              sortedShifts[j + 1][0] == sortedShifts[j + 1][0].toLowerCase()) {
            print(sortedShifts[j][0]);
            String temp = sortedShifts[j];
            sortedShifts[j] = sortedShifts[j + 1];
            sortedShifts[j + 1] = temp;
          }
        }
      }
    }
  }
}
