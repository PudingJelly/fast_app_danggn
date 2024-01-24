import 'notification_type.dart';

class DanggnNotification {
  final NotificationType type;
  final String title;
  final String description;
  final DateTime time;
  bool isRead;

  DanggnNotification(
    this.type,
    this.title,
    this.description,
    this.time, {
    this.isRead = false,
  });
}
