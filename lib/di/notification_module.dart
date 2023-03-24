import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NotificationModule {
  @lazySingleton
  AwesomeNotifications notifications() {
    return AwesomeNotifications();
  }
}
