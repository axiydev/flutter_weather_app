import 'package:flutter/material.dart';

class SunWidget extends StatelessWidget {
  final String? icon;
  final Color? color;
  const SunWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [
            color!.withOpacity(0.9),
            color!.withOpacity(0.8),
            color!.withOpacity(0.7),
            color!.withOpacity(0.6),
            color!.withOpacity(0.5),
            color!.withOpacity(0.4),
            color!.withOpacity(0.3),
            color!.withOpacity(0.2),
            color!.withOpacity(0.1),
            color!.withOpacity(0.05),
          ])),
      position: DecorationPosition.background,
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Image.asset(
          icon!,
          width: 90,
        ),
      ),
    );
  }
}
