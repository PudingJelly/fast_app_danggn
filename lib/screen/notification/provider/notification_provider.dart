import 'package:fast_app_base/data/network/danggn_api.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteNotificationProvider = FutureProvider((ref) async {
  final result = await DanggnApi.getNotification();
  return result.successData;
});

final notificationProvider = StateProvider<List<DanggnNotification>?>((ref) {
  final list = ref.watch(remoteNotificationProvider);
  if(list.hasValue) {
    return list.requireValue;
  }
  return null;
});