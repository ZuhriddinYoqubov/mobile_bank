import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mobile_bank/const/size_config.dart';

class MyGlassmorphicContainer extends StatelessWidget {
  double width;
  double height;
  double? borderRadius;
  Widget? child;
  MyGlassmorphicContainer(
      {required this.width,
      required this.height,
      this.child,
      this.borderRadius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: getUniqueW(width),
      height: getUniqueH(height),
      borderRadius: getUniqueW(borderRadius ?? 0),
      blur: 20,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 245, 59, 115).withOpacity(0.4),
            Color.fromARGB(255, 36, 25, 134).withOpacity(0.4),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: child,
    );
  }
}
