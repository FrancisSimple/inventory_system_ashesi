import 'package:flutter/material.dart';

import 'dart:ui';
/// Slide and scale transition.
/// The page will slide in from the bottom while scaling in.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideScaleTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);  // Start from bottom.
      const end = Offset.zero;
      const curve = Curves.ease;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}

/// Slide and scale transition used for logout animation.
/// The page will slide up and scale out.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route logoutTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);  // Slide from top.
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}

/// Slide up transition.
/// The page will slide in from the bottom.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideUpTransition(Widget page, {Duration duration = const Duration(milliseconds: 400)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);  // Slide up from bottom.
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: child,
      );
    },
  );
}

/// Scale and fade transition.
/// The page will scale and fade in simultaneously.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route scaleFadeTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}

/// Fade-through transition.
/// The page will fade in without any other animations.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route fadeThroughTransition(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

/// Slide left transition.
/// The page will slide in from the right to the left.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideLeftTransition(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);  // Slide from right.
      const end = Offset.zero;
      const curve = Curves.ease;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: child,
      );
    },
  );
}

/// Slide right transition.
/// The page will slide in from the left to the right.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideRightTransition(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);  // Slide from left.
      const end = Offset.zero;
      const curve = Curves.ease;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: child,
      );
    },
  );
}

/// Rotate transition.
/// The page will rotate in during the transition.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route rotateTransition(Widget page, {Duration duration = const Duration(milliseconds: 600)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return RotationTransition(
        turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}

/// Slide down transition.
/// The page will slide down from the top.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideDownTransition(Widget page, {Duration duration = const Duration(milliseconds: 400)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);  // Slide down from top.
      const end = Offset.zero;
      const curve = Curves.ease;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: child,
      );
    },
  );
}

/// Zoom in transition.
/// The page will zoom in from the center.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route zoomInTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}

/// Zoom out transition.
/// The page will zoom out during the transition.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route zoomOutTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 1.5, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}

/// Fade in transition.
/// The page will fade in during the transition.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route fadeInTransition(Widget page, {Duration duration = const Duration(milliseconds: 400)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

/// Blur transition.
/// The page will fade in with a blur effect.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route blurTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      );
    },
  );
}

/// Slide in diagonal transition.
/// The page will slide in diagonally from the bottom-right.
/// - [page]: The target page.
/// - [duration]: The duration of the transition.
Route slideInDiagonalTransition(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);  // Diagonal slide from bottom-right.
      const end = Offset.zero;
      const curve = Curves.ease;

      var curveAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(curveAnimation),
        child: child,
      );
    },
  );
}
