import 'package:fast_app_base/data/network/danggn_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productPostProvider =
    AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  return await DanggnApi.getPost(id);
});