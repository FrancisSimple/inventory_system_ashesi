// // ../../washking/washking/lib/components/splash.dart
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:washking/pages/auth/auth_gate.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   get splash => null;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage("assets/Horizontal Blue - Orange.png"),
//           opacity: 0.1,
//           repeat: ImageRepeat.repeat,
//           // fit: BoxFit.contain,
//         )),
//         height: MediaQuery.sizeOf(context).height,
//         width: MediaQuery.sizeOf(context).width,
//         child: Center(
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             AnimatedContainer(
//               duration: const Duration(seconds: 1),
//               constraints: BoxConstraints(
//                 maxHeight: 0.5 * MediaQuery.sizeOf(context).height,
//               ),
//               width: 0.6 * MediaQuery.sizeOf(context).width,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset("assets/WASHKING_Favicon.jpg"),
//               ),
//             ),
//             // const Text("Washking"),
//           ]),
//         ),
//       ),
//       splashIconSize: 1000,
//       backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
//       nextScreen: const AuthGate(),
//     );
//   }
// }
