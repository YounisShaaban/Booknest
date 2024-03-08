import 'package:flutter/material.dart';
import 'styles.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String title;

  const MyButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  double scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => scale = 0.9);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => scale = 1.0);
    widget.onTap?.call();
  }

  void _onTapCancel() {
    setState(() => scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: AppGradients.monochromaticGreenGradient.copyWith(
            borderRadius: BorderRadius.circular(50 / 2),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}






  // BoxDecoration getMonochromaticGreenGradient() {
  //   return BoxDecoration(
  //     gradient: LinearGradient(
  //       begin: Alignment.topLeft,
  //       end: Alignment.bottomRight,
  //       stops: [0.0, 0.5, 1.0],
  //       colors: [
  //         const Color(0xFF455947), // Dark green (100% opacity)
  //         const Color(0xFF455947).withOpacity(0.8), // 80% opacity
  //         const Color(0xFF455947).withOpacity(0.5), // 50% opacity
  //       ],
  //     ),
  //     borderRadius: BorderRadius.circular(16),
  //   );
  // }