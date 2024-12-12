// lib/src/slide_menu.dart

import 'package:flutter/material.dart';
import 'dart:math' show min;
import 'side_menu.dart';

class SlideSideMenuState extends SideMenuState {
  Duration animatedDuration;
  Curve curve;
  SlideSideMenuState({this.animatedDuration = const Duration(milliseconds: 350),this.curve=Curves.fastLinearToSlowEaseIn});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    final statusBarHeight = mq.padding.top;

    return Material(
      color: widget.background ?? Colors.orange,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: statusBarHeight + (widget.closeIcon?.size ?? 25.0) * 2,
            bottom: 0.0,
            width: min(size.width * 0.70, widget.maxMenuWidth),
            right: widget.inverse ? 0 : null,
            left: widget.inverse ? null : 0,
            child: widget.menu,
          ),
          getCloseButton(statusBarHeight),
          AnimatedContainer(
            duration: animatedDuration,
            curve: curve,
            transform: _getMatrix4(size),
            decoration: BoxDecoration(
              borderRadius: _getBorderRadius(),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 18.0),
                  color: Colors.black12,
                  blurRadius: 32.0,
                ),
              ],
            ),
            child: _getChild(),
          ),
        ],
      ),
    );
  }

  Widget _getChild() => isOpened
      ? SafeArea(
    child: ClipRRect(
      borderRadius: _getBorderRadius(),
      clipBehavior: Clip.antiAlias,
      child: widget.child,
    ),
  )
      : widget.child;

  BorderRadius _getBorderRadius() => isOpened
      ? (widget.radius ?? BorderRadius.circular(34.0))
      : BorderRadius.zero;

  Matrix4 _getMatrix4(Size size) {
    if (isOpened) {
      return Matrix4.identity()
        ..translate(
            min(size.width, widget.maxMenuWidth) *
                widget.inverseValue *
                (widget.inverse ? 0.6 : 0.9));
    }
    return Matrix4.identity();
  }
}
