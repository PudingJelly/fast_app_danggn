import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

import '../../entity/dummies.dart';

class DanggnApi {
  static Future<SimpleResult<List<DanggnNotification>, ApiError>>
      getNotification() async {
    await sleepAsync(500.ms);
    return SimpleResult.success(notificationList);
  }

  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(500.ms);
    return ProductPost(
        simpleProductPost: post1,
        content: '깨끗하게 잘 쓰던 물건이에요'
            '잘 쓰면 좋겠습니다'
            '감사합니다.');
  }
}
