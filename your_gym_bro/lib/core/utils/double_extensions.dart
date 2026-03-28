import 'package:flutter/widgets.dart';

extension DoubleViewportExtensions on num {
  double vw(BuildContext context) {
    return (this / 100) * MediaQuery.sizeOf(context).width;
  }

  double hv(BuildContext context) {
    return (this / 100) * MediaQuery.sizeOf(context).height;
  }
}
