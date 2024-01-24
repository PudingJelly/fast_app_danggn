import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DanggnApi {
  static Future<SimpleResult<List<DanggnNotification>, ApiError>> getNotification() async {
    await sleepAsync(3000.ms);
    return SimpleResult.success(notificationList);
  }
}