library one_line_shimmer;

import 'package:flutter/material.dart';

class OneLineShimmer extends StatefulWidget {
  /// The width of the shimmer container.
  final double width;

  /// The height of the shimmer container.
  final double height;

  /// Optional border radius for the container.
  final BorderRadius? borderRadius;

  /// Duration of the shimmer animation in milliseconds.
  final int milliseconds;

  /// The background color of the container.
  final Color baseColor;

  /// A list of exactly 3 colors used for the shimmer gradient.
  ///
  /// If not provided, defaults to 3 shades of grey.
  /// Must contain **exactly 3 colors** or a [FlutterError] is thrown.
  final List<Color>? shimmerColors;

  const OneLineShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.milliseconds = 750,
    this.baseColor = const Color(0xFFF5F5F5),
    this.shimmerColors,
  });

  @override
  State<OneLineShimmer> createState() => _OneLineShimmerState();
}

class _OneLineShimmerState extends State<OneLineShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.milliseconds),
    )..repeat();
    _shimmerAnimation = Tween(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.shimmerColors ??
        [
          Colors.grey.shade300,
          Colors.grey.shade200,
          Colors.grey.shade100,
        ];

    if (colors.length != 3) {
      throw FlutterError(
        "shimmerColors must contain exactly 3 colors, "
        "You provided ${colors.length}",
      );
    }

    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment(_shimmerAnimation.value, 0),
              end: Alignment(_shimmerAnimation.value + 1, 0),
              colors: colors,
              stops: const [0.2, 0.5, 0.8],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.baseColor,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
