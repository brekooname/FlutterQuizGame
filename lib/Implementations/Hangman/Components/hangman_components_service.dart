

class HangmanComponentsService {
  static final HangmanComponentsService singleton =
      HangmanComponentsService.internal();

  factory HangmanComponentsService() {
    return singleton;
  }

  HangmanComponentsService.internal();
}
