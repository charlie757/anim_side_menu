// lib/src/side_menu.dart

// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:anim_side_menu/anim_side_menu.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;


enum SideMenuType {
  animNRotate,
  animNSlide,
  slideNRotate,
  slide,
}

// lib/src/side_menu.dart

class SideMenu extends StatefulWidget {
  final int inverseValue; // Renamed to make it public
  final Widget child;
  final Color? background;
  final BorderRadius? radius;
  final Icon? closeIcon;
  final Widget menu;
  final double maxMenuWidth;
  final SideMenuType type;
  final void Function(bool isOpened)? onChange;
  final void Function()? onClosedIcon;
  Duration animatedDuration;
  Curve curve;
   SideMenu({
    Key? key,
    required this.child,
    this.background,
    this.radius,
    this.closeIcon = const Icon(
      Icons.close,
      color: Colors.black,
    ),
    this.animatedDuration =const Duration(milliseconds: 350),
    this.curve =Curves.fastLinearToSlowEaseIn,
    required this.menu,
    this.onClosedIcon,
    this.type = SideMenuType.animNRotate,
    this.maxMenuWidth = 275.0,
    bool inverse = false,
    this.onChange,
  })  : assert(maxMenuWidth > 0),
        inverseValue = inverse ? -1 : 1,
        super(key: key);

  static SideMenuState? of(BuildContext context) {
    return context.findAncestorStateOfType<SideMenuState>();
  }

  double degToRad(double deg) => (pi / 180) * deg;

  bool get inverse => inverseValue == -1;

  @override
  SideMenuState createState() {
    switch (type) {
      case SideMenuType.animNRotate:
        return AnimSlideRotateSideMenuState(animatedDuration: animatedDuration,curve: curve);
      case SideMenuType.animNSlide:
        return AnimSlideSideMenuState(animatedDuration: animatedDuration,curve: curve);
      case SideMenuType.slideNRotate:
        return SlideRotateSideMenuState(animatedDuration: animatedDuration,curve: curve);
      case SideMenuType.slide:
        return SlideSideMenuState(animatedDuration: animatedDuration,curve: curve);
      default:
        return SlideSideMenuState(animatedDuration: animatedDuration,curve: curve);
    }
  }
}

abstract class SideMenuState extends State<SideMenu> {
  bool _opened = false;

  void openSideMenu() {
    setState(() => _opened = true);
    if (widget.onChange != null) {
      widget.onChange!(_opened);
    }
  }

  void closeSideMenu() {
    setState(() => _opened = false);
    if (widget.onChange != null) {
      widget.onChange!(_opened);
    }
  }

  bool get isOpened => _opened;

  /// Make this method accessible to subclasses by removing the underscore
  Widget getCloseButton(double statusBarHeight) {
    return widget.closeIcon != null
        ? Positioned(
      top: statusBarHeight,
      left: widget.inverse ? null : 0,
      right: widget.inverse ? 0 : null,
      child: IconButton(
        icon: widget.closeIcon!,
        onPressed: () {
          closeSideMenu();
          // if  (widget.onClosedIcon != null) widget.onClosedIcon!();
        },
      ),
    )
        : Container();
  }
}
