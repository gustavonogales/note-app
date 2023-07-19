import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Duration _duration = const Duration(milliseconds: 50);
  final double _opacity = 0.5;

  const TouchableOpacity({
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: widget._duration,
        opacity: isDown ? widget._opacity : 1,
        child: widget.child,
      ),
    );
  }
}
