import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ModernCircularProgressIndicator
/// - size: diameter in px
/// - strokeWidth: width of the ring
/// - gradient: if null, a default gradient is used
/// - value: if provided (0..1) it's determinate, otherwise indeterminate
/// - label: optional center widget (e.g., percentage text)
class ModernCircularProgressIndicator extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final Gradient? gradient;
  final double? value; // 0..1 for determinate
  final Widget? label;

  const ModernCircularProgressIndicator({
    Key? key,
    this.size = 72.0,
    this.strokeWidth = 8.0,
    this.gradient,
    this.value,
    this.label,
  }) : super(key: key);

  @override
  _ModernCircularProgressIndicatorState createState() =>
      _ModernCircularProgressIndicatorState();
}

class _ModernCircularProgressIndicatorState
    extends State<ModernCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = widget.gradient ??
        const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
        );

    final determinate = widget.value != null;

    // Outer size container
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background faint circle
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _BackgroundCirclePainter(widget.strokeWidth),
            ),
          ),

          // Rotating gradient progress (indeterminate) or static gradient (determinate)
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: Center(
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) {
                  // For determinate we don't rotate the shader
                  final rotation =
                  determinate ? 0.0 : _rotationController.value * 2 * 3.1416;
                  return Transform.rotate(
                    angle: rotation,
                    child: child,
                  );
                },
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return gradient.createShader(rect);
                  },
                  child: SizedBox(
                    width: widget.size,
                    height: widget.size,
                    child: CircularProgressIndicator(
                      value: widget.value,
                      strokeWidth: widget.strokeWidth,
                      backgroundColor: Colors
                          .transparent, // background circle already drawn by painter
                    ),
                  ),
                ),
              ),
            ),
          ),

          // small glossy dot at top to make it look modern (optional)
          Positioned(
            top: widget.size * 0.06,
            child: Container(
              width: widget.strokeWidth * 1.1,
              height: widget.strokeWidth * 1.1,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
            ),
          ),

          // center label if provided
          if (widget.label != null) widget.label!,
        ],
      ),
    );
  }
}

class _BackgroundCirclePainter extends CustomPainter {
  final double stroke;
  _BackgroundCirclePainter(this.stroke);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint p = Paint()
      ..color = Colors.grey.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width / 2) - (stroke / 2);
    canvas.drawCircle(center, radius, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
