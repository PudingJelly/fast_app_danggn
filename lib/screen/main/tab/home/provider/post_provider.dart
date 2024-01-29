import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postProvider = StateProvider<List<SimpleProductPost>>((ref) =>
    postList
);