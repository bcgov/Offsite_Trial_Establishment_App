import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';

extension AppPaddingWidgets on AppPadding {
  Widget get spacer => SizedBox.square(dimension: size);

  Widget get horizontalSpacer => SizedBox(width: size);

  Widget get verticalSpacer => SizedBox(height: size);

  Widget expanded([int flex = 1]) => Expanded(
        flex: flex,
        child: spacer,
      );
}
