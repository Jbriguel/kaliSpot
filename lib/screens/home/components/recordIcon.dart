import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalispot/theme/colors/appColors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Recordicon extends StatefulWidget {
  Recordicon({
    super.key,
    required this.plusWidth,
    this.press,
  });

  double plusWidth;
  void Function()? press;

  @override
  State<Recordicon> createState() => _RecordiconState();
}

class _RecordiconState extends State<Recordicon> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();
  late final AnimationController _controller2 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();
  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.6, end: 1.2).animate(_controller);
  late final Animation<double> _scaleAnimation2 =
      Tween<double>(begin: 0.6, end: 1.5).animate(_controller2);
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 1, end: 0.2).animate(_controller);

// ###############################################################################//

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press?.call();
      },
      child: Stack(alignment: AlignmentDirectional.center, children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation2,
            child: Container(
              width: (90 - widget.plusWidth) * 1.5,
              height: (90 - widget.plusWidth) * 1.5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.easyGreen.withOpacity(0.5)),
            ),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: (80 - widget.plusWidth) * 1.5,
              height: (80 - widget.plusWidth) * 1.5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.easyGreen.withOpacity(0.5)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all((25 - (widget.plusWidth * 0.3))),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.easyGreen,
            shape: BoxShape.circle,
            border: Border.all(width: 1.5, color: Colors.grey.shade300),
          ),
          child: Icon(Icons.mic,
              color: AppColors.deepGreen, size: 50 - (widget.plusWidth * 0.5)),
        ),
      ]),
    );
  }
}
