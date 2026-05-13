import 'package:ygb_sdk/ygb_sdk.dart';

class AppDependencyResolver {
  static Future<void> setup() async {
    // Core dependencies
    CoreDIResolver.getInstance().register<CoreCache>(await Cache.getInstance());

    // // Register repositories, use cases, and other dependencies here
    // CoreDIResolver.getInstance().register<CoreCache>(await Cache.getInstance());

    // Modules
    UserConnectionModule();
  }
}
