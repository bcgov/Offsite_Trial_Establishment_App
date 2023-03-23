import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/instance_name.dart';
import 'package:offsite_trial_establishment_app/common/constants/notifications.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/services/notification_service.dart';

@Singleton(as: NotificationService)
class AwesomeNotificationService extends NotificationService {
  final AwesomeNotifications _plugin;
  final bool needRequestPermission;

  AwesomeNotificationService(
    this._plugin,
    @Named(InstanceNames.isForeground) this.needRequestPermission,
  ) {
    _init();
  }

  @override
  Future<void> sendNotification({
    required String title,
    required String text,
    required bool isSuccessful,
  }) async {
    if (isSuccessful) {
      await _plugin.cancelAll();
    }
    await _plugin.createNotification(
      content: NotificationContent(
        id: 1,
        // for show only last notification in group
        channelKey: AppNotification.baseChannel,
        groupKey: isSuccessful ? AppNotification.successGroup : AppNotification.errorGroup,
        notificationLayout: NotificationLayout.BigText,
        title: title,
        body: text,
      ),
    );
  }

  Future<void> _init() async {
    await _plugin.initialize(
      null,
      [
        NotificationChannel(
          channelKey: AppNotification.baseChannel,
          channelName: Strings.notifications.baseChannelTitle(),
          channelDescription: Strings.notifications.baseChannelDescription(),
        ),
      ],
      debug: false,
    );
    if (needRequestPermission) await _plugin.requestPermissionToSendNotifications();
  }
}
