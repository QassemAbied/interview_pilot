import 'package:flutter/widgets.dart';

abstract final class FocusHelper {
  FocusHelper._();

  static void next(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }

  static void previous(BuildContext context) {
    FocusScope.of(context).previousFocus();
  }

  static void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void request(FocusNode focusNode) {
    focusNode.requestFocus();
  }
}
