

class HangmanContainerService {

  static final HangmanContainerService singleton =
      HangmanContainerService.internal();

  factory HangmanContainerService() {
    return singleton;
  }

  HangmanContainerService.internal();

}
