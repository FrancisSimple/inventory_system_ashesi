// ../../washking/washking/lib/themes/theme_switch.dart
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';



class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    // final isDark = Provider.of<ThemeNotifier>(context, listen: true).isDarkMode;
    return Switch.adaptive(
      // value: isDark,
      value: false,
      trackColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.tertiaryContainer),
      
      thumbIcon: WidgetStatePropertyAll(
        Icon(
          // isDark 
          false
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
              color:
              // isDark
              false
              ? Theme.of(context).colorScheme.primaryFixedDim:null,
        ),
      ),
      onChanged: (value) {
        // Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
      },
    );
  }
}
