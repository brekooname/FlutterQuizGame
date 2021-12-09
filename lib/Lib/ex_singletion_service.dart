

class xxxService {

  static final xxxService singleton = xxxService.internal();

  factory xxxService() {
    return singleton;
  }

  xxxService.internal();
}
