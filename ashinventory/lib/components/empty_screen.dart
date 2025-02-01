// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// // User Task Screen
// class EmptyScreen extends StatelessWidget {
//   final String? title;
//   final String? subtitle;
//   final String? description;
//   final double? height;
//   const EmptyScreen({
//     super.key,
//     this.title,
//     this.subtitle,
//     this.description,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Container(
//         decoration: const BoxDecoration(
//            color: Colors.black12,
//             image: DecorationImage(
//           image: AssetImage("assets/Vertical Blue - Orange (1).png"),
//           opacity: 0.1,
//           repeat: ImageRepeat.repeat,
//           fit: BoxFit.contain,
//         )),
//         // color: Colors.amber,
//         height: height ?? 0.8 * MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Lottie.asset(
//               "assets/loading_data.json",
//               width: 200,
//               repeat: false,
//               // height: 10
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RichText(
//                   softWrap: true,
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                           color: Theme.of(context).colorScheme.primaryContainer,
//                           fontWeight: FontWeight.bold,
//                         ),
//                     children: [
//                      if (title != null)  TextSpan(text: title),
//                      if (title != null)  const TextSpan(text: "\n"),
//                       if (subtitle != null) TextSpan(text: subtitle),
//                       if (subtitle != null) const TextSpan(text: "\n"),
//                       if (description != null)
//                         TextSpan(
//                             text: description,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium!
//                                 .copyWith(
//                                   color: Theme.of(context)
//                                       .colorScheme
//                                       .primaryContainer,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                       if (description != null) const TextSpan(text: "\n"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // User Task Screen
// class EmptyReportScreen extends StatelessWidget {
//   const EmptyReportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.6 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Uh oh 😬\n"),
//                 const TextSpan(text: "No progress reports yet\n"),
//                 TextSpan(
//                     text: "Attend to this task ASAP!\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Admin Task Screen
// class EmptyOverdueTaskManagementScreen extends StatelessWidget {
//   const EmptyOverdueTaskManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.6 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Good job 🥳\n"),
//                 const TextSpan(text: "No overdue tasks so far\n"),
//                 TextSpan(
//                     text: "Check up on other tasks\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Admin Task Screen
// class EmptyInProgressTaskManagementScreen extends StatelessWidget {
//   const EmptyInProgressTaskManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.6 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Great 😎\n"),
//                 const TextSpan(text: "No tasks in the pipeline\n"),
//                 TextSpan(
//                     text: "Create more tasks\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Admin Task Screen
// class EmptyCompletedTaskManagementScreen extends StatelessWidget {
//   const EmptyCompletedTaskManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.6 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Sigh... 😪\n"),
//                 const TextSpan(text: "No tasks completed yet\n"),
//                 TextSpan(
//                     text: "Let's get things done\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Admin Task Screen
// class EmptyTaskManagementScreen extends StatelessWidget {
//   const EmptyTaskManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.6 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Hmmm... 🤔\n"),
//                 const TextSpan(text: "Got some tasks on your mind?\n"),
//                 TextSpan(
//                     text: "Create one to get things moving!\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // User History Screen
// class EmptyHistoryScreen extends StatelessWidget {
//   const EmptyHistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: 0.8 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "Oops...🥲\n"),
//                 const TextSpan(text: "No history yet\n"),
//                 TextSpan(
//                     text: "Your previous activities show here.\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Admin Employee Screen
// class EmptyEmployeeScreen extends StatelessWidget {
//   const EmptyEmployeeScreen({
//     super.key,
//     this.subComponent = false,
//   });
//   final bool subComponent;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: SizedBox(
//         // color: Colors.amber,
//         height: subComponent
//             ? 0.4 * MediaQuery.of(context).size.height
//             : 0.8 * MediaQuery.of(context).size.height,
//         child: Center(
//           child: RichText(
//             softWrap: true,
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//               children: [
//                 const TextSpan(text: "😪Oops...\n "),
//                 const TextSpan(text: "No employee added yet\n"),
//                 TextSpan(
//                     text: "Add one to get things started!\n",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
