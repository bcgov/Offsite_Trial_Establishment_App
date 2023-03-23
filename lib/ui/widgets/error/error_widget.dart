part of 'error_handler.dart';

class ErrorWidget extends StatefulWidget {
  final Widget child;

  const ErrorWidget({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _DefaultErrorHandler();
}

class _DefaultErrorHandler extends State<ErrorWidget> implements ErrorHandler {
  final _pages = <_ErrorPageState>[];

  @override
  Widget build(BuildContext context) {
    return _ErrorInheritedHandler(
      state: this,
      child: widget.child,
    );
  }

  @override
  Map<String, String> handle(Map<String, String> errors) {
    if (errors.isEmpty) return {};
    var unhandled = errors;
    var isSuccess = false;
    var pagesIndex = _pages.length - 1;
    while (!isSuccess && pagesIndex >= 0) {
      unhandled = _pages.last.handle(errors);
      isSuccess = errors.length != unhandled.length;
      pagesIndex--;
    }
    return unhandled;
  }

  @override
  void _register(_ErrorPageState state) {
    _pages.add(state);
  }

  @override
  void _unregister(_ErrorPageState state) {
    _pages.remove(state);
  }
}

class _ErrorInheritedHandler extends InheritedWidget {
  final _DefaultErrorHandler state;

  const _ErrorInheritedHandler({
    super.key,
    required super.child,
    required this.state,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
