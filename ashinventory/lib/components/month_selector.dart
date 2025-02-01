import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  DateTime selectedDate = DateTime.now();
  void Function()? onNext() {
    if ((selectedDate.month == DateTime.now().month) &&
        (selectedDate.year == DateTime.now().year)) {
      return null;
    } else {
      return () => setState(() {
            selectedDate = DateTime(
                selectedDate.year, selectedDate.month + 1, selectedDate.day);
            // debugPrint(selectedDate.toString());
          });
    }
  }

  void Function()? onPrev() {
    //  if (selectedDate >  DateTime.now().month) {
    return () => setState(() {
          // selectedDate -= 1;
          selectedDate = DateTime(
                selectedDate.year, selectedDate.month - 1, selectedDate.day);
        });
    //  } else {
    //    return null;
    //  }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(selectedDate.toString());
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat("MMMM, yyyy").format(selectedDate),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            IconButton.filled(
              onPressed: onPrev(),
              icon: const Icon(Icons.chevron_left_rounded),
            ),
            const SizedBox(
              width: 4,
            ),
            IconButton.filled(
              // color: Theme.of(context).colorScheme.,
              onPressed: onNext(),
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        )
      ],
    );
  }
}
