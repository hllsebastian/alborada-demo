import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    required this.child,
    this.borderRadius,
    super.key,
    this.padding = EdgeInsets.zero,
    this.highlightColor = Colors.transparent,
    this.color,
    this.onPressed,
    this.boxShadow,
    this.border,
    this.width,
    this.height,
    this.riddleEffectColor,
    this.riddleEffectDuration = const Duration(milliseconds: 200),
    this.clipBehavior = Clip.antiAlias,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final double? width;
  final double? height;
  final Color highlightColor;
  final Color? riddleEffectColor;
  final Duration riddleEffectDuration;
  final Clip clipBehavior;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.riddleEffectDuration,
  )..addStatusListener(listener);

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
    }
  }

  // ignore: avoid_positional_boolean_parameters
  void onHighlightChanged(bool value) {
    if (value && widget.riddleEffectColor != null) {
      controller.forward(from: controller.value);
    }
  }

  @override
  void dispose() {
    controller
      ..removeStatusListener(listener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = widget.borderRadius;
    // borderRadius ??= context.tablet ? borderRadius24 : borderRadius12;
    return Stack(
      children: [
        ClipRRect(
          clipBehavior: widget.clipBehavior,
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, child) {
                final color = widget.color ?? Colors.grey.shade200;
                final riddleEffectColor = widget.riddleEffectColor;
                var backgroundColor = color;
                if (riddleEffectColor != null) {
                  backgroundColor = Color.lerp(
                    color,
                    riddleEffectColor,
                    controller.value,
                  )!;
                }
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: widget.boxShadow,
                    border: widget.border,
                    borderRadius: borderRadius,
                  ),
                  child: child,
                );
              },
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: widget.onPressed,
                  highlightColor: widget.highlightColor,
                  onHighlightChanged: onHighlightChanged,
                  child: Padding(
                    padding: widget.padding,
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
