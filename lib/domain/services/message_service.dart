import 'package:offsite_trial_establishment_app/domain/models/message.dart';

abstract class MessageService {
  Stream<Message> getMessages();

  Future<bool> sendMessage({
    required Message message,
  });
}
