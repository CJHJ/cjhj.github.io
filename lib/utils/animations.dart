import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// Animate a container by translating it from a specific direction, along with an opacity change
enum MoveInDirection { fromAbove, fromBelow, fromRight, fromLeft }

class AnimatedFadeMoveIn extends StatelessWidget {
  AnimatedFadeMoveIn(
      {Key key,
      this.isWidgetVisible,
      this.moveInDirection = MoveInDirection.fromAbove,
      this.offset = 100.0,
      this.duration = const Duration(seconds: 1),
      this.child});

  final bool isWidgetVisible;
  final MoveInDirection moveInDirection;
  final double offset;
  final Duration duration;
  final Widget child;

  Matrix4 getTranslationDirection(MoveInDirection direction) {
    double startPosition, endPosition = 0.0;
    Matrix4 transform;

    if (direction == MoveInDirection.fromAbove) {
      startPosition = -offset;
      transform = Matrix4.translationValues(
          0.0, this.isWidgetVisible ? endPosition : startPosition, 0.0);
    } else if (direction == MoveInDirection.fromBelow) {
      startPosition = offset;
      transform = Matrix4.translationValues(
          0.0, this.isWidgetVisible ? endPosition : startPosition, 0.0);
    } else if (direction == MoveInDirection.fromLeft) {
      startPosition = -offset;
      transform = Matrix4.translationValues(
          this.isWidgetVisible ? endPosition : startPosition, 0.0, 0.0);
    } else {
      startPosition = offset;
      transform = Matrix4.translationValues(
          this.isWidgetVisible ? endPosition : startPosition, 0.0, 0.0);
    }

    return transform;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: this.duration,
      curve: Curves.easeOut,
      transform: getTranslationDirection(this.moveInDirection),
      child: AnimatedOpacity(
        duration: this.duration,
        opacity: this.isWidgetVisible ? 1.0 : 0.0,
        child: this.child,
      ),
    );
  }
}
