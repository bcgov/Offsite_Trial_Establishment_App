import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/domain/services/lifecycle_service.dart';

@Singleton(as: LifecycleService)
class DefaultLifecycleService extends WidgetsBindingObserver implements LifecycleService {
  List<LifecycleCallback> listeners = [];

  DefaultLifecycleService() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void addListener(LifecycleCallback callback) {
    listeners.add(callback);
  }

  @override
  void removeListener(LifecycleCallback callback) {
    listeners.remove(callback);
  }

  @override
  void removeAllListeners() {
    listeners.clear();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    for (var element in listeners) {
      element(state);
    }
  }
}
