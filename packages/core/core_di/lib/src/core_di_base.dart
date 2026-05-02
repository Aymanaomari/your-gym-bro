abstract interface class CoreDIBase {
  void register<T extends Object>(T instance, {String? instanceName});
  T resolve<T extends Object>({String? instanceName});
  T? tryResolve<T extends Object>({String? instanceName});
  bool isRegistered<T extends Object>({String? instanceName});
  void unregister<T extends Object>({String? instanceName});
  void registerFactory<T extends Object>(
    T Function() factory, {
    String? instanceName,
  });
  void registerFactoryParam<T extends Object, P1, P2>(
    T Function(P1 param1, P2 param2) factory, {
    String? instanceName,
  });
  void registerSingleton<T extends Object>(T instance, {String? instanceName});
  void registerLazySingleton<T extends Object>(
    T Function() factory, {
    String? instanceName,
  });
  void reset();
}
