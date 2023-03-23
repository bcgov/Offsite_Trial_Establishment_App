part of 'error_handler.dart';

mixin ErrorState<T extends StatefulWidget> on State<T> {
  bool _isAdded = false;
  final key = GlobalKey();

  String? validationKeyOf(covariant T widget);

  Widget buildContent(BuildContext context);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    registerIfNeed();
    return Container(
      key: key,
      child: buildContent(context),
    );
  }

  @override
  @mustCallSuper
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldKey = validationKeyOf(oldWidget);
    final newKey = validationKeyOf(widget);
    if (oldKey != newKey) {
      if (oldKey != null) ErrorPage._of(context)?._unregister(oldKey);
      if (newKey != null) ErrorPage._of(context)?._register(newKey, this);
    }
  }

  void registerIfNeed() {
    if (!_isAdded) {
      final key = validationKeyOf(widget);
      if (key != null) ErrorPage._of(context)?._register(key, this);
    }
  }

  @override
  void deactivate() {
    final key = validationKeyOf(widget);
    if (key != null) ErrorPage._of(context)?._unregister(key);
    _isAdded = false;
    super.deactivate();
  }

  void showError(String error);

  void handleError(String error) {
    showError(error);
    ErrorContainer._of(context)?.registerError(key);
  }
}
