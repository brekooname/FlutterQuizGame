import 'dart:math';

class HistoryGameService {
  private

  void initNextQuestion() {
    Set<Integer> allQPlayed = historyPreferencesService.getAllLevelsPlayed(
        questionContainerCreatorService.getCampaignLevelEnum());
    for (Integer i : (List<Integer>)
      questionContainerCreatorService.getQuestionNrInOrder()
    ) {
    if (!allQPlayed.contains(i)) {
    firstOpenQuestionIndex = questionContainerCreatorService.getQuestionNrInOrder().indexOf(i);
    currentQuestion = getRandomNextQuestion();
    while (allQPlayed.contains(currentQuestion)) {
    currentQuestion = getRandomNextQuestion();
    }
    addAction(Actions.sequence(Actions.delay(1f), Utils.createRunnableAction(new Runnable() {
    @Override
    public void run() {
    scrollToOption = firstOpenQuestionIndex;
    scrollPanePositionInit = 0;
    }
    })));
    break;
    }
    }
  }

  List<int> initQuestionNrInOrder() {
    List<int> qNr = [];
    for (int i = 0; i < gameContext.getCurrentUserGameUser().getAllQuestionInfos().size(); i++) {
      qNr.add(i);
    }
    return qNr;
  }

  int getRandomNextQuestion(int firstOpenQuestionIndex,
      List<int> questionNrInOrder) {
    int nr = Random().nextInt(5) + firstOpenQuestionIndex;
    int size = questionNrInOrder.length;
    return questionNrInOrder.elementAt(min(nr, size - 1)
    );
  }
}