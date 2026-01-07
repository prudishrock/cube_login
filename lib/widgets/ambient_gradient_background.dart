import 'package:flutter/material.dart';

class AmbientGradientBackground extends StatelessWidget {
  final Widget child;

  const AmbientGradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base vertical gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF102B2E),
                Color(0xFF0C1F22),
                Color(0xFF071416),
              ],
              stops: [0.0, 0.55, 1.0],
            ),
          ),
        ),

        // Cyan ambient glow
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, -0.35),
              radius: 0.9,
              colors: [
                const Color(0xFF25D1F4).withOpacity(0.18),
                const Color(0xFF25D1F4).withOpacity(0.06),
                const Color(0x00000000),
              ],
            ),
          ),
        ),

        // Optional vignette
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xCC000000),
                Color(0x00000000),
              ],
            ),
          ),
        ),

        child,
      ],
    );
  }
}
