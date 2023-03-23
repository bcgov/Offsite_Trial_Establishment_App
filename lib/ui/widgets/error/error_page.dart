part of 'error_handler.dart';

class ErrorPage extends StatefulWidget {
  final Widget child;

  const ErrorPage({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _ErrorPageState();

  static _ErrorPageState? _of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_ErrorInherited>();
    return scope?.state;
  }
}

class _ErrorPageState extends State<ErrorPage> {
  final widgets = <String, ErrorState>{};
  bool isAdded = false;

  @override
  void deactivate() {
    ErrorHandler.of(context)?._unregister(this);
    isAdded = false;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (!isAdded) ErrorHandler.of(context)?._register(this);
    isAdded = true;
    return _ErrorInherited(
      state: this,
      child: widget.child,
    );
  }

  Map<String, String> handle(Map<String, String> errors) {
    final unhandled = <String, String>{};
    for (final error in errors.entries) {
      final widget = widgets[error.key];
      if (widget != null) {
        widget.handleError(error.value);
      } else {
        unhandled[error.key] = error.value;
      }
    }
    return unhandled;
  }

  void _unregister(String key) {
    widgets.remove(key);
  }

  void _register(String key, ErrorState errorState) {
    widgets[key] = errorState;
  }
}

class _ErrorInherited extends InheritedWidget {
  final _ErrorPageState state;

  const _ErrorInherited({
    super.key,
    required super.child,
    required this.state,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
