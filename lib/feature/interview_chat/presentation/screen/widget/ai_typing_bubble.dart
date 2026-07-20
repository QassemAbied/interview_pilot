import 'package:flutter/material.dart';

class AiTypingBubble extends StatefulWidget {
  const AiTypingBubble({super.key});

  @override
  State<AiTypingBubble> createState() => _AiTypingBubbleState();
}

class _AiTypingBubbleState extends State<AiTypingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AnimatedDot(controller: _controller, delay: 0.0),
            const SizedBox(width: 4),
            _AnimatedDot(controller: _controller, delay: 0.2),
            const SizedBox(width: 4),
            _AnimatedDot(controller: _controller, delay: 0.4),
          ],
        ),
      ),
    );
  }
}

class _AnimatedDot extends StatelessWidget {
  const _AnimatedDot({required this.controller, required this.delay});

  final AnimationController controller;
  final double delay;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final value = (controller.value - delay).clamp(0.0, 1.0);

        final scale = 0.6 + (0.6 * (1 - (value - 0.5).abs() * 2));

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
