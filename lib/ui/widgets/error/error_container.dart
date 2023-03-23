part of 'error_handler.dart';

mixin ErrorContainer<T extends StatefulWidget> on State<T> {
  Axis get direction;

  ScrollController get controller;

  final key = GlobalKey();

  Completer? _completer;
  Rect? _errorRect;

  Widget buildContent(BuildContext context);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return _ErrorContainerInherited(
      container: this,
      child: Container(
        key: key,
        child: buildContent(context),
      ),
    );
  }

  Future<void> registerError(GlobalKey key) async {
    final bounds = key.bounds;
    if (bounds == null) return;
    _addRect(bounds);
    await (_completer ?? _createCompleter()).future;
  }

  void _addRect(Rect rect) {
    _errorRect = _errorRect?.combine(rect) ?? rect;
  }

  Completer _createCompleter() {
    final completer = Completer();
    _completer = completer;
    WidgetsBinding.instance.addPostFrameCallback(_runScroll);
    return completer;
  }

  static ErrorContainer? _of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_ErrorContainerInherited>();
    return scope?.container;
  }

  void _runScroll(Duration timeStamp) {
    _completer?.complete();
    if (_errorRect == null) return;
    final bounds = key.bounds ?? Rect.zero;
    final offset = direction == Axis.vertical ? _errorRect!.top : _errorRect!.left;
    final padding = direction == Axis.vertical ? bounds.top : bounds.left;
    final size = direction == Axis.vertical ? bounds.height : bounds.width;
    _errorRect = null;
    _completer = null;
    if (bounds != Rect.zero && (offset < padding || offset > size + padding)) {
      _scrollTo(offset + controller.offset - padding - AppPadding.normal.size);
    }
  }

  void _scrollTo(double offset) {
    controller.animateTo(
      offset,
      duration: AnimationDuration.medium,
      curve: Curves.easeInOut,
    );
  }
}

class _ErrorContainerInherited extends InheritedWidget {
  final ErrorContainer container;

  const _ErrorContainerInherited({
    super.key,
    required super.child,
    required this.container,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
