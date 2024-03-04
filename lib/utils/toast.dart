import 'package:flutter_music/widgets/loading_dialog.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Toast {
  static void show(String message) {
    SmartDialog.showToast(message);
  }

  static void showLoading([String? msg]) {
    SmartDialog.showLoading(
      backDismiss: false,
      animationType: SmartAnimationType.scale,
      builder: (_) => LoadingDialog(text: msg),
    );
  }
}
