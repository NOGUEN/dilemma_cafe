import 'package:flutter/material.dart';

class SequentialAnimateText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;
  final double height;
  const SequentialAnimateText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.duration,
    required this.height,
  });
  @override
  State<SequentialAnimateText> createState() => _SequentialAnimateTextState();
}

class _SequentialAnimateTextState extends State<SequentialAnimateText>
    with TickerProviderStateMixin {
  List<AnimationController> _controller = [];
  List<Animation<double>> _animation = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() async {
    for (int i = 0; i < widget.text.length; i++) {
      _controller.add(
        AnimationController(
          vsync: this,
          duration: widget.duration,
        ),
      );
      _animation.add(
        Tween<double>(
          begin: 0,
          end: widget.height,
        ).animate(_controller[i]),
      );

      // 각 애니메이션의 시작 시간을 지연시킴
      Future.delayed(const Duration(milliseconds: 5) * i, () {
        if (mounted) {
          _controller[i].repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.text.length; i++) {
      _controller[i].dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < widget.text.length; i++)
        AnimatedBuilder(
          animation: _animation[i],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation[i].value),
              child: Text(
                widget.text[i],
                style: widget.textStyle,
              ),
            );
          },
        ),
    ]);
  }
}

class BlinkingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;
  final Color blinkColor;

  const BlinkingText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.duration,
    required this.blinkColor,
  }) : super(key: key);

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: widget.textStyle.color,
      end: widget.blinkColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          widget.text,
          style: widget.textStyle.copyWith(color: _colorAnimation.value),
        );
      },
    );
  }
}
