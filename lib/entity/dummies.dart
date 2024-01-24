import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickName: '홍길동',
  profileUrl: picSum(1010),
  temperature: 36.5,
);
final user2 = User(
  id: 2,
  nickName: '박영희',
  profileUrl: picSum(500),
  temperature: 36.5,
);
final user3 = User(
  id: 3,
  nickName: '이젤',
  profileUrl: picSum(222),
  temperature: 36.5,
);

final product1 = Product(
  user1,
  '갤럭시 S23 울트라 화이트',
  1200000,
  ProductStatus.booked,
  [
    picSum(500),
    picSum(501),
    picSum(502),
    picSum(503),
  ],
);
final product2 = Product(
  user2,
  '잘나가는 자전거 급처',
  400000,
  ProductStatus.normal,
  [
    picSum(100),
    picSum(101),
    picSum(102),
    picSum(103),
  ],
);
final product3 = Product(
  user3,
  '아이폰13',
  700000,
  ProductStatus.normal,
  [
    picSum(600),
    picSum(601),
    picSum(602),
    picSum(603),
  ],
);
final product4 = Product(
  user1,
  '버즈2 프로',
  100000,
  ProductStatus.normal,
  [
    picSum(900),
    picSum(901),
    picSum(902),
    picSum(903),
  ],
);

final post1 = SimpleProductPost(
  1,
  product1.user,
  product1,
  '글의 내용입니다.',
  const Address(
    '경기도 의왕시 이미로',
    '포일동',
  ),
  10,
  3,
  DateTime.now().subtract(30.minutes),
);
final post2 = SimpleProductPost(
  2,
  product3.user,
  product2,
  '글의 내용입니다.',
  const Address(
    '경기도 의왕시 이미로',
    '마을동',
  ),
  20,
  10,
  DateTime.now().subtract(5.minutes),
);
final post3 = SimpleProductPost(
  3,
  product2.user,
  product3,
  '글의 내용입니다.',
  const Address(
    '경기도 의왕시 이미로',
    '인덕원동',
  ),
  100,
  120,
  DateTime.now().subtract(10.seconds),
);

final postList = [post1, post2, post3, post1, post2, post3];
