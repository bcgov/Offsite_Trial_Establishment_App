import 'package:flutter/cupertino.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';

class TrailingTextFieldIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;

  const TrailingTextFieldIcon({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AssetsImage(path: icon),
    );
  }
}
