import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/constants/instance_name.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class LogModule {
  @preResolve
  @lazySingleton
  Future<Logger> logger(@Named(InstanceNames.logFile) String logFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final logOutPutFile = File('${directory.path}/$logFile');
    return Logger(
      printer: PrettyPrinter(printTime: true),
      output: MultiOutput([
        ConsoleOutput(),
        FileOutput(file: logOutPutFile), // IDE shows error on this line but compiles successfully for Android and iOS
      ]),
      level: AppEnvironment.IS_RELEASE ? Level.error : Level.verbose,
    );
  }

  @LazySingleton(env: AppEnvironment.foreground)
  @Named(InstanceNames.logFile)
  String get foreground => 'foreground-log.txt';

  @LazySingleton(env: AppEnvironment.background)
  @Named(InstanceNames.logFile)
  String get background => 'background-log.txt';
}
