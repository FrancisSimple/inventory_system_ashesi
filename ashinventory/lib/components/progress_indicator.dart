// ../../washking/washking/lib/components/progress_indicator.dart
import 'package:flutter/material.dart';
import 'package:ashinventory/services/callback.dart';

class SmoothProgressIndicator extends StatelessWidget {
  final double value; // Progress value from 0.0 to 1.0
  final double minHeight; // Height of the progress indicator
  final Duration duration; // Duration of smooth transitions
  final Color lowProgressColor; // Color when progress is low
  final Color mediumProgressColor; // Color when progress is medium
  final Color highProgressColor; // Color when progress is high

  const SmoothProgressIndicator({
    super.key,
    required this.value,
    this.minHeight = 10.0,
    this.duration = const Duration(milliseconds: 500),
    this.lowProgressColor = Colors.red,
    this.mediumProgressColor = Colors.orange,
    this.highProgressColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: value), // Animate between values
      duration: duration,
      builder: (context, value, child) {
        return LinearProgressIndicator(
          color: getProgressColor(
            progress: value,
            lowProgressColor: lowProgressColor,
            mediumProgressColor: mediumProgressColor,
            highProgressColor: highProgressColor,
          ),
          value: value,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          minHeight: minHeight,
        );
      },
    );
  }
}
