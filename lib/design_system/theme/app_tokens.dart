import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/design_system/theme/screen_size_helper.dart';

class AppSpacing {
  const AppSpacing();

  final double _superSmall = 2.0;
  final double _extraSmall = 4.0;
  final double _small = 8.0;
  final double _medium = 16.0;
  final double _large = 24.0;
  final double _extraLarge = 32.0;
  final double _superLarge = 48.0;

  ScreenSizeValue<double> get _logo => ScreenSizeValue<double>(
    mobile: _large,
    tablet: _large,
    desktop: _large,
  );

  double logo(BuildContext context) =>
      ScreenSizeHelper.getValue(context, _logo);

  ScreenSizeValue<double> get content => ScreenSizeValue<double>(
    mobile: _large,
    tablet: _large,
    desktop: _large,
  );
  ScreenSizeValue<double> get screen => ScreenSizeValue<double>(
    mobile: _extraLarge,
    tablet: _extraLarge,
    desktop: _extraLarge,
  );
  ScreenSizeValue<double> get textFormField => ScreenSizeValue<double>(
    mobile: _extraSmall,
    tablet: _extraSmall,
    desktop: _extraSmall,
  );
  ScreenSizeValue<double> get authFormContent => ScreenSizeValue<double>(
    mobile: _extraLarge,
    tablet: _extraLarge,
    desktop: _extraLarge,
  );
  ScreenSizeValue<double> get authFormFields => ScreenSizeValue<double>(
    mobile: _small,
    tablet: _small,
    desktop: _small,
  );
}

class AppRadius {
  const AppRadius();

  final double _small = 4.0;
  final double _medium = 8.0;
  final double _large = 16.0;

  ScreenSizeValue<double> get textFormField => ScreenSizeValue<double>(
    mobile: _small,
    tablet: _small,
    desktop: _small,
  );

  ScreenSizeValue<double> get button => ScreenSizeValue<double>(
    mobile: _small,
    tablet: _small,
    desktop: _small,
  );
}

class AppSizes {
  const AppSizes();
  final double iconSizeSmall = 16.0;
  final double iconSizeMedium = 24.0;
  final double iconSizeLarge = 32.0;
  final double avatarSize = 40.0;
  final double minTouchTarget = 44.0;
  final double buttonHeight = 48.0;
  final double avatarSizeMedium = 56.0;
}
