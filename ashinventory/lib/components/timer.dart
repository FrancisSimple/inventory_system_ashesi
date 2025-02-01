// import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// class CountdownTimer extends StatefulWidget {
//   final int hours; // Total hours
//   final int minutes; // Total minutes
//   final TextStyle? timerTextStyle; // Customizable text style
//   final Color? backgroundColor; // Customizable background color
//   final double? radius; // Customizable circle radius
//   final VoidCallback? onTimerComplete; // Action on timer complete
//   final Function(double)? onProgress; // Callback for progress updates

//   const CountdownTimer({
//     super.key,
//     required this.hours,
//     required this.minutes,
//     this.timerTextStyle,
//     this.backgroundColor = Colors.blueAccent,
//     this.radius = 20.0,
//     this.onTimerComplete,
//     this.onProgress, // Added callback to notify progress
//   });

//   @override
//   State<CountdownTimer> createState() => _CountdownTimerState();
// }

// class _CountdownTimerState extends State<CountdownTimer>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late int remainingTime;
//   late int totalTime; // Total time in seconds

//   String get timerString {
//     Duration duration = Duration(seconds: remainingTime);
//     String hours = duration.inHours.toString().padLeft(2, '0');
//     String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return "$hours:$minutes:$seconds";
//   }

//   @override
//   void initState() {
//     super.initState();

//     // Convert hours and minutes to total seconds
//     totalTime = (widget.hours * 3600) + (widget.minutes * 60);
//     remainingTime = totalTime;

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: remainingTime),
//     )..forward();

//     // Periodic timer to update remaining time
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted && remainingTime > 0) {
//         setState(() {
//           remainingTime--;
//           // Calculate progress as the ratio of remaining to total time
//           double progress = (remainingTime / totalTime);
//           if (widget.onProgress != null) {
//             widget.onProgress!(progress); // Notify the parent about progress
//           }
//         });
//       } else if (remainingTime == 0) {
//         timer.cancel();
//         if (widget.onTimerComplete != null) {
//           widget.onTimerComplete!();
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         timerString,
//         style: widget.timerTextStyle ?? 
//             GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//             ),
//       ),
//     );
//   }
// }
