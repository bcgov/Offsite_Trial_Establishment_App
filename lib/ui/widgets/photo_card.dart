import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';

final _buttonSize = 40.w;

class PhotoCard extends StatelessWidget {
  final String photo;
  final Function(String)? onRemove;

  const PhotoCard({
    super.key,
    required this.photo,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Radii.normal),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _image,
          if (onRemove != null) _button(context),
        ],
      ),
    );
  }

  Widget get _image => LayoutBuilder(
        builder: (_, constraints) => Image.file(
          File(photo),
          fit: BoxFit.cover,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        ),
      );

  Widget _button(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Radii.normal),
            bottomLeft: Radius.circular(Radii.normal),
          ),
          color: context.colorScheme.surface,
        ),
        width: _buttonSize,
        height: _buttonSize,
        padding: EdgeInsets.all(AppPadding.extraSmall.size),
        child: GestureDetector(
          onTap: () => onRemove?.call(photo),
          child: const AssetsImage(path: ImageAssets.remove),
        ),
      );
}
