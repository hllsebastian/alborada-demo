import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension SnackbarX on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(SnackBar snackBar) => scaffoldMessenger
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

extension GetItX on BuildContext {
  GetIt get getInstance => GetIt.I;
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get dialogWidth => width * (tablet ? .35 : .4);
  double get tooltipWidth => width * (tablet ? .55 : .45);
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;
  EdgeInsets get padding => mediaQuery.padding;
}

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  Brightness get brightness => theme.brightness;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension TextThemeX on BuildContext {
  TextTheme get textTheme => theme.textTheme;

  /// [TextStyle] for Phones Devices
  TextStyle? get _titlesPhone => textTheme.headlineLarge;
  // TextStyle? get _phoneParentTitles => textTheme.labelMedium;
  TextStyle? get _buttonsPhone => textTheme.headlineMedium;
  TextStyle? get _regularButtonPhone =>
      textTheme.bodySmall!.copyWith(fontSize: 18);
  TextStyle? get _descriptionPhone => textTheme.headlineSmall;
  TextStyle? get _secondaryPhone => textTheme.titleMedium;
  TextStyle? get _bodyLargePhone => textTheme.bodyMedium;
  TextStyle? get _titleMediumPhone => textTheme.titleSmall;
  TextStyle? get _bodyMedium => textTheme.bodyMedium;
  TextStyle? get _bodySmall => textTheme.bodySmall;

  /// [TextStyle] for iPads Devices
  TextStyle? get _titlesIpad => textTheme.displayLarge;
  TextStyle? get _buttonsIpad => textTheme.displayMedium;
  TextStyle? get _regularButtonIpad =>
      textTheme.bodySmall!.copyWith(fontSize: 36);
  TextStyle? get _descriptionIpad => textTheme.displaySmall;
  TextStyle? get _secondaryIpad => textTheme.titleLarge;
  TextStyle? get _bodyLargeIpad => textTheme.bodyLarge;
  TextStyle? get _titleMediumIpad => textTheme.titleMedium;

  TextStyle? get titles {
    if (tablet) {
      return _titlesIpad;
    }
    return _titlesPhone;
  }

  TextStyle? get buttons {
    if (tablet) {
      return _buttonsIpad;
    }
    return _buttonsPhone;
  }

  TextStyle? get regularButton {
    if (tablet) {
      return _regularButtonIpad;
    }
    return _regularButtonPhone;
  }

  TextStyle? get descriptions {
    if (tablet) {
      return _descriptionIpad;
    }
    return _descriptionPhone;
  }

  TextStyle? get secondary {
    if (tablet) {
      return _secondaryIpad;
    }
    return _secondaryPhone;
  }

  TextStyle? get body {
    if (tablet) {
      return _bodyMedium;
    }
    return _bodySmall;
  }

  TextStyle? get bodyLarge {
    if (tablet) {
      return _bodyLargeIpad;
    }
    return _bodyLargePhone;
  }

  TextStyle? get titleMedium {
    if (tablet) {
      return _titleMediumIpad;
    }
    return _titleMediumPhone;
  }
}

extension ResponsiveX on BuildContext {
  DeviceScreenType get type => getDeviceType(mediaQuery.size);

  bool get tablet => switch (type) {
        DeviceScreenType.mobile => false,
        _ => true,
      };
}
