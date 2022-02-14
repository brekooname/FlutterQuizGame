class DopeWarsPriceService {
  static const int daysToChange = 2;
  static const int startingBudget = 5000;

  static int getPriceBasedOnStartingBudgetWithPercent(
      int percentOutOfStartingBudget) {
    return ((percentOutOfStartingBudget / 100) * startingBudget).toInt();
  }

  static int getPriceBasedOnStartingBudgetWithPercentAndDaysPassed(
      int percentOutOfStartingBudget, int daysPassed) {
    return getPriceBasedOnStartingBudgetWithPercentAndDaysPassedAndDaysChanged(
        percentOutOfStartingBudget, daysPassed, daysToChange, startingBudget);
  }

  static int
      getPriceBasedOnStartingBudgetWithPercentAndDaysPassedAndDaysChanged(
          int percentOutOfStartingBudget,
          int daysPassed,
          int daysChange,
          int budget) {
    int price =
        getPriceBasedOnStartingBudgetWithPercent(percentOutOfStartingBudget);

    int percentToChange = daysPassed ~/ daysChange;
    int priceToIncrease = (budget * (percentToChange / 100)).toInt();

    return price + priceToIncrease;
  }
}
