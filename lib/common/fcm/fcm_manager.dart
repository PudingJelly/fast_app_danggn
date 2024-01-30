import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app.dart';

class FcmManager {
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize(WidgetRef ref) async {
    final token = await FirebaseMessaging.instance.getToken();
    print(token);
    // FirebaseMessaging.instance.onTokenRefresh.listen((event) {
    //   API로 token 전송
    // });

    // Foreground
    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      if (title == null) {
        return;
      }
      ref.read(floatingButtonStateProvider.notifier).hideButton();
      final controller = App.navigatorKey.currentContext?.showSnackbar(title,
          extraButton: Tap(
            onTap: () {
              App.navigatorKey.currentContext!.go(message.data['deeplink']);
            },
            child: '열기'.text.white.bold.make().p(20),
          ));
      await controller?.closed;
      ref.read(floatingButtonStateProvider.notifier).showButton();
      debugPrint(message.toString());
    });

    // background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      App.navigatorKey.currentContext!.go(message.data['deeplink']);
    });

    // Not running (detached)
    final firstMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (firstMessage != null) {
      await sleepUntil(() =>
          App.navigatorKey.currentContext != null &&
          App.navigatorKey.currentContext!.mounted);
      final context = App.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(firstMessage.data['deeplink']);
      }
    }
  }
}
