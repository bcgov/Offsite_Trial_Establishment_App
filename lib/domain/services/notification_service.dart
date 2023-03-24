abstract class NotificationService {
  Future<void> sendNotification({
    required String text,
    required String title,
    required bool isSuccessful,
  });
}
