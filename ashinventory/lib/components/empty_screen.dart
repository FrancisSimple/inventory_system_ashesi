import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// User Task Screen
class EmptyScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final double? height;
  const EmptyScreen({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.black12,
          // image: DecorationImage(
          //   image: AssetImage("assets/Vertical Blue - Orange (1).png"),
          //   opacity: 0.1,
          //   repeat: ImageRepeat.repeat,
          //   fit: BoxFit.contain,
          // ),
        ),
        // color: Colors.amber,
        height: height ?? 0.7*MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   "assets/loading_data.json",
            //   width: 200,
            //   repeat: false,
            //   // height: 10
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      if (title != null) TextSpan(text: title),
                      if (title != null) const TextSpan(text: "\n"),
                      if (subtitle != null) TextSpan(text: subtitle),
                      if (subtitle != null) const TextSpan(text: "\n"),
                      if (description != null)
                        TextSpan(
                            text: description,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  fontWeight: FontWeight.bold,
                                )),
                      if (description != null) const TextSpan(text: "\n"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class MiniEmptyScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final double? height;
  const MiniEmptyScreen({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.black12,
          // image: DecorationImage(
          //   image: AssetImage("assets/Vertical Blue - Orange (1).png"),
          //   opacity: 0.1,
          //   repeat: ImageRepeat.repeat,
          //   fit: BoxFit.contain,
          // ),
        ),
        // color: Colors.amber,
        height: height ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   "assets/loading_data.json",
            //   width: 200,
            //   repeat: false,
            //   // height: 10
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        if (title != null) TextSpan(text: title),
                        if (title != null) const TextSpan(text: "\n"),
                        if (subtitle != null) TextSpan(text: subtitle, style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            // fontWeight: FontWeight.bold,
                          )),
                        if (subtitle != null) const TextSpan(text: "\n"),
                        if (description != null)
                          TextSpan(
                              text: description,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontWeight: FontWeight.bold,
                                  )),
                        if (description != null) const TextSpan(text: "\n"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
