

class XxxService {

  static final XxxService singleton = XxxService.internal();

  factory XxxService() {
    return singleton;
  }

  XxxService.internal();
}
