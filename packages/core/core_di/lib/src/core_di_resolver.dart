import 'package:core_di/src/core_di_base.dart';
import 'package:core_di/src/core_di_base_imp.dart';

/// Central entry-point to resolve DI without exposing implementation details.
final class CoreDIResolver {
  CoreDIResolver._();

  static CoreDIBase getInstance() => CoreDiBaseImp.getInstance();
}
