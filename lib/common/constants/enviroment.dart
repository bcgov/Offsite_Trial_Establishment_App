import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:injectable/injectable.dart';

abstract class AppEnvironment {
  static const bool IS_RELEASE = foundation.kReleaseMode;

  static const bool IS_DEBUG = !foundation.kReleaseMode;

  static final bool IS_TEST = Platform.environment.containsKey('FLUTTER_TEST');

  static const key = 'env';

  static const devRefresh = 'dev_refresh';

  static const prodRefresh = 'prod_refresh';

  static const testRefresh = 'test_refresh';

  static const devSync = 'dev_sync';

  static const prodSync = 'prod_sync';

  static const testSync = 'test_sync';

  static const foreground = [
    Environment.prod,
    Environment.dev,
    Environment.test,
  ];

  static const background = [
    AppEnvironment.prodRefresh,
    AppEnvironment.devRefresh,
    AppEnvironment.testRefresh,
    AppEnvironment.prodSync,
    AppEnvironment.devSync,
    AppEnvironment.testSync,
  ];

  static const refresh = [
    AppEnvironment.prodRefresh,
    AppEnvironment.devRefresh,
    AppEnvironment.testRefresh,
  ];

  static const sync = [
    AppEnvironment.prodSync,
    AppEnvironment.devSync,
    AppEnvironment.testSync,
  ];

  static const debug = [
    Environment.dev,
    Environment.test,
    AppEnvironment.devRefresh,
    AppEnvironment.testRefresh,
    AppEnvironment.devSync,
    AppEnvironment.testSync,
  ];
  static const release = [
    Environment.prod,
    AppEnvironment.prodRefresh,
    AppEnvironment.prodSync,
  ];
}

extension StringBackground on String {
  String refreshMode() => '${this}_refresh';

  String syncMode() => '${this}_sync';
}
