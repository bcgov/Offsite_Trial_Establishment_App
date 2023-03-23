import 'dart:convert';

import 'package:flutter_background_executor/flutter_background_executor.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/instance_name.dart';
import 'package:offsite_trial_establishment_app/common/extensions/stream_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/background_task_manager.dart';
import 'package:offsite_trial_establishment_app/domain/models/message.dart';
import 'package:offsite_trial_establishment_app/domain/services/message_service.dart';

@LazySingleton(as: MessageService)
class DefaultMessageService extends MessageService {
  final EngineConnector? _connector;
  final bool isRefresh;

  DefaultMessageService(
    @Named(InstanceNames.taskIdentifier) String taskName,
    @Named(InstanceNames.isRefresh) this.isRefresh,
  ) : _connector = isRefresh ? null : BackgroundTaskManager.createConnector(taskName);

  @override
  Stream<Message> getMessages() {
    if (_connector == null || isRefresh) {
      throw Exception("You cannot get messages in refresh mode");
    }
    return _connector!.messageStream
        .map((event) => jsonDecode(event.content))
        .mapWhereType<Map<String, dynamic>, Message>(Message.fromJson);
  }

  @override
  Future<bool> sendMessage({required Message message}) async {
    if (_connector == null || isRefresh) {
      throw Exception("You cannot get messages in refresh mode");
    }
    return _connector!.messageSender(commonMessage: true, message: jsonEncode(message.toJson()));
  }
}
