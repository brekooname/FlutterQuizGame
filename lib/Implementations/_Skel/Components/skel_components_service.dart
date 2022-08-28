

class SkelComponentsService {
  static final SkelComponentsService singleton =
      SkelComponentsService.internal();

  factory SkelComponentsService() {
    return singleton;
  }

  SkelComponentsService.internal();
}
