import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _svgExtension = '.svg';

class AssetsImage extends StatefulWidget {
  final BoxFit fit;
  final String? path;
  final double opacity;
  final double? width;
  final double? height;
  final Color? color;

  const AssetsImage({
    Key? key,
    required this.path,
    this.fit = BoxFit.contain,
    this.opacity = 1,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AssetsImageState();
}

class _AssetsImageState extends State<AssetsImage> {
  late bool isSvg;

  @override
  void initState() {
    _checkType();
    super.initState();
  }

  void _checkType() {
    isSvg = widget.path?.endsWith(_svgExtension) == true;
  }

  @override
  void didUpdateWidget(covariant AssetsImage oldWidget) {
    if (widget.path != oldWidget.path) _checkType();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.path == null) return const SizedBox();
    if (isSvg) {
      return _wrapper(SvgPicture.asset(
        widget.path!,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        color: widget.color,
      ));
    }
    return _wrapper(Image.asset(
      widget.path!,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
    ));
  }

  Widget _wrapper(Widget child) => Opacity(
        opacity: widget.opacity,
        child: child,
      );
}
