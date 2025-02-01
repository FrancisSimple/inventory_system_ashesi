// // ../../washking/washking/lib/components/card.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:washking/components/button.dart';

// class CustomCard extends StatelessWidget {
//   final Widget child;

//   const CustomCard({
//     super.key,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       // constraints: BoxConstraints(minHeight: 20),
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surface,
//           borderRadius: BorderRadius.circular(20),
//           // border: Border.all(
//           //   color: Theme.of(context).colorScheme.surfaceContainer
//           // ),

//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).colorScheme.surfaceContainerLowest,
//               blurRadius: 5,
//               spreadRadius: 5,
//               offset: const Offset(-3, -3),
//             ),
//             BoxShadow(
//               color: Theme.of(context)
//                   .colorScheme
//                   .surfaceContainer
//                   .withOpacity(0.8),
//               blurRadius: 5,
//               spreadRadius: 5,
//               offset: const Offset(5, 5),
//             ),
//           ]),
//       child: child,
//     );
//   }
// }

// class QuizAnnouncementCard extends StatelessWidget {
//   final String title;
//   final String subject;
//   final String duration;
//   final String dueDate;
//   final void Function() onTap;

//   const QuizAnnouncementCard({
//     super.key,
//     required this.title,
//     required this.subject,
//     required this.duration,
//     required this.dueDate,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: CustomCard(
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             const SizedBox(height: 10),
//             Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Subject: $subject")),
//             Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("TIme Allowed: $duration")),
//             Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Due date: $dueDate")),
//             const SizedBox(
//               height: 20,
//             ),
//             Align(
//                 alignment: Alignment.centerRight,
//                 child: OutlinedCustomButton(text: "Start", onPressed: onTap)),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResultAnnouncementCard extends StatelessWidget {
//   final String title;
//   final String subject;
//   final double score;
//   // String duration;
//   // String dueDate;
//   final void Function() onTap;

//   const ResultAnnouncementCard({
//     super.key,
//     required this.title,
//     required this.subject,
//     required this.score,
//     // required this.duration,
//     // required this.dueDate,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: CustomCard(
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             const SizedBox(height: 10),
//             Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Subject: $subject")),
//             Align(
//                 alignment: Alignment.centerLeft, child: Text("Score: $score%")),
//             const SizedBox(
//               height: 10,
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: OutlinedCustomButton(
//                 onPressed: () {},
//                 text: "View",
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AssessmentCard extends StatelessWidget {
//   final String title;
//   final String subject;
//   final String duration;
//   final double? score;
//   final String dueDate;
//   final void Function() onViewScore;
//   final void Function() onStart;

//   const AssessmentCard({
//     super.key,
//     required this.title,
//     required this.subject,
//     required this.duration,
//     required this.score,
//     required this.dueDate,
//     required this.onViewScore,
//     required this.onStart,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // constraints: BoxConstraints(
//       //   minHeight: 200,
//       // height: 400,
//       height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
//       //   maxWidth: 500,
//       // ),
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: CustomCard(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 15.0),
//                 child: Text(
//                   title,
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         subject,
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).colorScheme.secondary,
//                             ),
//                       )),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Due: $dueDate",
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             // color: Theme.of(context).colorScheme.tertiary,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 duration,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       // color: Theme.of(context).colorScheme.tertiary,
//                     ),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Breakpoints.mediumAndUp.isActive(context)
//                 ? Row(children: [
//                     Expanded(
//                       child: FullOutlineButton(
//                           onPressed: onViewScore,
//                           text: "View Score",
//                           enabled: score == null ? true : false),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: FullButton(
//                           onPressed: onStart,
//                           text: "Start Quiz",
//                           enabled: score == null ? false : true),
//                     ),
//                   ])
//                 // ? Row(children: [
//                 //     Expanded(
//                 //       child: FullOutlineButton(
//                 //         onPressed: onViewScore,
//                 //         text: "View Score",
//                 //       ),
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10,
//                 //     ),
//                 //     Expanded(
//                 //       child: FullButton(
//                 //         onPressed: onStart,
//                 //         text: "Start Quiz",
//                 //       ),
//                 //     ),
//                 //   ])
//                 : Column(children: [
//                     FullOutlineButton(
//                         onPressed: onViewScore,
//                         text: "View Score",
//                         enabled: score == null ? true : false),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     FullButton(
//                         onPressed: onStart,
//                         text: "Start Quiz",
//                         enabled: score == null ? false : true),
//                   ]),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MockCard extends StatelessWidget {
//   final String title;
//   final String subject;
//   final String duration;
//   final double? score;
//   final String dueDate;
//   final void Function() onViewScore;
//   final void Function() onStart;

//   const MockCard({
//     super.key,
//     required this.title,
//     required this.subject,
//     required this.duration,
//     required this.score,
//     required this.dueDate,
//     required this.onViewScore,
//     required this.onStart,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // constraints: BoxConstraints(
//       //   minHeight: 200,
//       // height: 400,
//       height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
//       //   maxWidth: 500,
//       // ),
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: CustomCard(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 15.0),
//                 child: Text(
//                   title,
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         subject,
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).colorScheme.secondary,
//                             ),
//                       )),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Due: $dueDate",
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             // color: Theme.of(context).colorScheme.tertiary,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 duration,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       // color: Theme.of(context).colorScheme.tertiary,
//                     ),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Breakpoints.mediumAndUp.isActive(context)
//                 ? Row(children: [
//                     Expanded(
//                       child: FullOutlineButton(
//                           onPressed: onViewScore,
//                           text: "View Score",
//                           enabled: score == null ? true : false),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: FullButton(
//                           onPressed: onStart,
//                           text: "Start Exam",
//                           enabled: score == null ? false : true),
//                     ),
//                   ])
//                 // ? Row(children: [
//                 //     Expanded(
//                 //       child: FullOutlineButton(
//                 //         onPressed: onViewScore,
//                 //         text: "View Score",
//                 //       ),
//                 //     ),
//                 //     SizedBox(
//                 //       width: 10,
//                 //     ),
//                 //     Expanded(
//                 //       child: FullButton(
//                 //         onPressed: onStart,
//                 //         text: "Start Quiz",
//                 //       ),
//                 //     ),
//                 //   ])
//                 : Column(children: [
//                     FullOutlineButton(
//                         onPressed: onViewScore,
//                         text: "View Score",
//                         enabled: score == null ? true : false),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     FullButton(
//                         onPressed: onStart,
//                         text: "Start Exam",
//                         enabled: score == null ? false : true),
//                   ]),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Card widget for each facility type
// class ThroneFacilityCard extends StatelessWidget {
//   final String facilityName;
//   final void Function()? onTap;

//   const ThroneFacilityCard(
//       {super.key, required this.facilityName, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         color: Theme.of(context).colorScheme.primaryContainer,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Text(
//               facilityName,
//               style: TextStyle(
//                 color: Theme.of(context).colorScheme.onPrimaryContainer,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OptionTile extends StatelessWidget {
//   final String option;
//   final String explanation;
//   final bool isSelected;
//   final bool isCorrect; // Add a property to track correctness
//   final bool isChecking;
//   final VoidCallback onTap;

//   const OptionTile({
//     required this.option,
//     required this.isSelected,
//     required this.explanation,
//     required this.isCorrect,
//     required this.onTap,
//     required this.isChecking,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // debugPrint("option: $option correct: $isCorrect");
//     return GestureDetector(
//       onTap: isChecking ? null : onTap,
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 8.0),
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: isChecking
//                   ? (!isCorrect
//                       ? isSelected
//                           ? (isCorrect
//                               ? Colors.green.withOpacity(0.2)
//                               : Colors.red.withOpacity(0.2))
//                           : Theme.of(context)
//                               .colorScheme
//                               .surfaceContainerHighest
//                       : Colors.green.withOpacity(0.2))
//                   : isSelected
//                       ? Theme.of(context).colorScheme.surfaceContainerHighest
//                       : Theme.of(context).colorScheme.surfaceContainerLowest,
//               border: Border.all(
//                 color: !isChecking
//                     ? Theme.of(context).colorScheme.primary
//                     : isSelected
//                         ? (isCorrect ? Colors.green : Colors.red)
//                         : Colors.grey,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     option,
//                     style: GoogleFonts.dmSans(
//                         fontWeight:
//                             isSelected ? FontWeight.w600 : FontWeight.normal),
//                   ),
//                 ),
//                 if (isCorrect && isChecking)
//                   const Icon(
//                     Icons.check,
//                     color: Colors.green,
//                   ),
//                 if (isSelected && !isCorrect && isChecking)
//                   const Icon(
//                     Icons.close,
//                     color: Colors.red,
//                   ),
//               ],
//             ),
//           ),
//           if (isCorrect && isChecking) Text("Explanation: \n$explanation"),
//           if (isCorrect && isChecking)
//             const SizedBox(
//               height: 10,
//             )
//         ],
//       ),
//     );
//   }
// }

// class ErrorCard extends StatelessWidget {
//   final String title;
//   // final void Function()? onPressed;
//   // final void Function()? onLongPressed;
//   const ErrorCard({
//     super.key,
//     required this.title,
//     // required this.onPressed,
//     // this.onLongPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           // color: Theme.of(context).colorScheme.surfaceContainer,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(
//               width: 2,
//               color: Theme.of(context).colorScheme.tertiaryContainer)),
//       constraints: const BoxConstraints(
//         maxWidth: 300,
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             // color: Theme.of(context).colorScheme.surfaceContainer,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//                 width: 2,
//                 color: Theme.of(context).colorScheme.tertiaryContainer)),
//         constraints: const BoxConstraints(
//           maxWidth: 300,
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//               fontSize: 15, color: Theme.of(context).colorScheme.error),
//         ),
//         // trailing: IconButton.filledTonal(
//         //     onPressed: onPressed,
//         //     icon: const Icon(Icons.arrow_forward_ios_rounded)),
//       ),
//     );
//   }
// }

// class ReceiptTile extends StatelessWidget {
//   final String label;
//   final String value;
//   const ReceiptTile({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }
