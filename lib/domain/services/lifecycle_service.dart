import 'package:flutter/material.dart';

typedef LifecycleCallback = Function(AppLifecycleState);

abstract class LifecycleService {
  void addListener(LifecycleCallback callback);

  void removeListener(LifecycleCallback callback);

  void removeAllListeners();
}
