import 'dart:async';

import 'package:core_di/src/core_di_base.dart';
import 'package:get_it/get_it.dart';

class CoreDiBaseImp implements CoreDIBase {
  CoreDiBaseImp(this._getIt);

  static final CoreDiBaseImp _instance = CoreDiBaseImp(GetIt.instance);

  static CoreDiBaseImp getInstance() => _instance;

  final GetIt _getIt;

  @override
  bool isRegistered<T extends Object>({String? instanceName}) {
    return _getIt.isRegistered<T>(instanceName: instanceName);
  }

  @override
  void register<T extends Object>(T instance, {String? instanceName}) {
    registerSingleton<T>(instance, instanceName: instanceName);
  }

  @override
  void registerFactory<T extends Object>(
    T Function() factory, {
    String? instanceName,
  }) {
    _getIt.registerFactory<T>(factory, instanceName: instanceName);
  }

  @override
  void registerFactoryParam<T extends Object, P1, P2>(
    T Function(P1 param1, P2 param2) factory, {
    String? instanceName,
  }) {
    _getIt.registerFactoryParam<T, P1, P2>(factory, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(
    T Function() factory, {
    String? instanceName,
  }) {
    _getIt.registerLazySingleton<T>(factory, instanceName: instanceName);
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerSingleton<T>(instance, instanceName: instanceName);
  }

  @override
  void reset() {
    unawaited(_getIt.reset());
  }

  @override
  T resolve<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }

  @override
  T? tryResolve<T extends Object>({String? instanceName}) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      return null;
    }
    return resolve<T>(instanceName: instanceName);
  }

  @override
  void unregister<T extends Object>({String? instanceName}) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      return;
    }
    _getIt.unregister<T>(instanceName: instanceName);
  }
}
