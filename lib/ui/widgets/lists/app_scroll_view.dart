import 'package:flutter/cupertino.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/lists/app_scroll_behavior.dart';

class AppScrollView extends StatefulWidget {
  final EdgeInsets padding;
  final List<Widget> children;
  final Axis scrollDirection;
  final bool isRoot;

  const AppScrollView({
    super.key,
    required this.padding,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.isRoot = false,
  });

  @override
  State<StatefulWidget> createState() => _AppScrollView();
}

class _AppScrollView extends State<AppScrollView> with ErrorContainer {
  @override
  final controller = ScrollController();

  @override
  Axis get direction => widget.scrollDirection;

  @override
  Widget buildContent(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: direction,
        padding: widget.padding,
        physics: const ScrollPhysics(),
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    switch (direction) {
      case Axis.horizontal:
        return Row(
          children: _children(context),
        );
      case Axis.vertical:
        return Column(
          children: _children(context),
        );
    }
  }

  List<Widget> _children(BuildContext context) => [
        ...widget.children,
        if (widget.isRoot)
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
      ];
}
