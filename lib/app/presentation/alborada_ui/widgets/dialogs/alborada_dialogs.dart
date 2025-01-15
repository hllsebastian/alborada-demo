import 'dart:ui';

import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

enum AlboradaDialogType { delete, custom }

Future<T> showBlurry<T>(BuildContext context, Future<T> future) async {
  AlboradaDialog._blurry(context);
  final result = await future;
  if (context.mounted) {
    AlboradaDialog.hide(context);
  }
  return result;
}

class AlboradaDialog extends StatelessWidget {
  const AlboradaDialog._delete({
    required String cancelText,
    required VoidCallback onConfirm,
    required String title,
    required String subtitle,
    required String confirmText,
    VoidCallback? onCancel,
  })  : type = AlboradaDialogType.delete,
        _title = title,
        _subtitle = subtitle,
        _child = null,
        _confirmText = confirmText,
        _cancelText = cancelText,
        _onCancel = onCancel,
        _onConfirm = onConfirm;

  const AlboradaDialog._custom({required Widget child})
      : type = AlboradaDialogType.custom,
        _child = child,
        _title = null,
        _subtitle = null,
        _confirmText = null,
        _onCancel = null,
        _onConfirm = null,
        _cancelText = null;

  final AlboradaDialogType type;
  final String? _confirmText;
  final VoidCallback? _onConfirm;
  final VoidCallback? _onCancel;
  final String? _cancelText;
  final String? _title;
  final String? _subtitle;
  final Widget? _child;

  static Future<T?> delete<T>(
    BuildContext context, {
    required String cancelText,
    required String title,
    required VoidCallback onConfirm,
    required String subtitle,
    required String confirmText,
    VoidCallback? onCancel,
    AlboradaDialogType type = AlboradaDialogType.delete,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlboradaDialog._delete(
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  static Future<T?> custom<T>(
    BuildContext context, {
    required Widget child,
    AlboradaDialogType type = AlboradaDialogType.custom,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlboradaDialog._custom(child: child),
    );
  }

  static void _blurry(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const SizedBox.expand(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static void hide(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Builder(
          builder: (_) => switch (type) {
            AlboradaDialogType.custom => _child!,
            AlboradaDialogType.delete => CustomCard(
                padding: context.tablet ? edgeInsets40 : edgeInsets30,
                color: context.colorScheme.onPrimary,
                borderRadius: borderRadius8,
                width: context.dialogWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _title!,
                      style: context.titles!.copyWith(
                        color: context.colorScheme.onSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    gap28,
                    Text(
                      _subtitle!,
                      style: context.secondary!.copyWith(
                        color: context.colorScheme.onSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (context.tablet) gap40 else gap28,
                    SimpleButton(
                      text: _confirmText!,
                      textColor: context.colorScheme.secondaryContainer,
                      onPressed: () {
                        Navigator.pop(context);
                        _onConfirm?.call();
                      },
                    ),
                    if (context.tablet) gap24 else gap12,
                    SimpleButton(
                      text: _cancelText!,
                      textColor: context.colorScheme.onTertiaryContainer,
                      onPressed: () {
                        _onCancel?.call();
                      },
                    ),
                  ],
                ),
              ),
          },
        ),
      ),
    );
  }
}
