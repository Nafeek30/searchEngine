class Alphabetize {
  /// This function sorts all the lines in alphabetical order
  alphabetize(List<String> sortedShifts) {
    sortedShifts.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }
}
