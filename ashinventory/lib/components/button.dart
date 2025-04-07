// components/button.dart
import 'package:flutter/material.dart';

// ROUNDED Button
class SideNavButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool sub;
  final Color? buttonColor;
  // final Color? iconColor;
  final bool hasIcon;
  final bool isActive;
  final void Function()? onPressed;
  final void Function()? onIconPressed;

  const SideNavButton({
    super.key,
    required this.text,
    this.sub = false,
    this.hasIcon = false,
    this.isActive = false,
    required this.onPressed,
    this.onIconPressed,
    this.icon,
    this.buttonColor,
    // this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      // color:isActive? Theme.of(context).colorScheme.surfaceTint:null,
      child: ListTile(
        dense: true,
        // minTileHeight: 48,
        // minVerticalPadding: 12,
        // selected: true,
        // style: ListTileStyle.drawer,
        tileColor: isActive ? Theme.of(context).colorScheme.surfaceTint : null,
        hoverColor: Theme.of(context).colorScheme.secondaryFixedDim,
        splashColor: Theme.of(context).colorScheme.primaryContainer,
        contentPadding: EdgeInsets.fromLTRB(sub ? 24 : 16, 0, 16, 0),
        // minVerticalPadding: 1,

        onTap: onPressed,
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isActive
                  ? Theme.of(context).colorScheme.onPrimary
                  : sub
                      ? const Color(0xff433939)
                      : Theme.of(context).colorScheme.shadow),
        ),
        trailing: hasIcon || sub
            ? SizedBox(
                width: 32,
                height: 24,
                child: MaterialButton(
                  textColor: sub
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: buttonColor ??
                      (sub
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.primary),

                  // color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: onIconPressed,
                  child: icon ??
                      Icon(
                        sub ? Icons.remove : Icons.add,
                        size: 16,
                        
                      ),
                ),
              )
            : null,
      ),
    );
  }
}

// OUTLINED Button
class OutlinedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinedCustomButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          // elevation: WidgetStatePropertyAll(10),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 15)),
          side: WidgetStatePropertyAll(BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ))),
      child: Text(text),
    );
  }
}

//Full Button
class FullButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? color;

  const FullButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
      ),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        enableFeedback: enabled,
        disabledColor: color?.withOpacity(0.5) ??
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),

        color: color?.withOpacity(enabled ? 1 : 0.4) ??
            Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(enabled ? 1 : 0.4),

        textColor: Theme.of(context).colorScheme.onPrimary,
        minWidth: double.maxFinite,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        // style: ButtonStyle(
        //     // elevation: WidgetStatePropertyAll(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //     side: WidgetStatePropertyAll(BorderSide(
        //       width: 2,
        //     ))),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 15,
                letterSpacing: 5,
              ),
        ),
      ),
    );
  }
}

//Full Button
class FullOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? color;

  const FullOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        // disabledColor:
        //     Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),

        // color: Theme.of(context).colorScheme.primary,
        textColor: color ?? Theme.of(context).colorScheme.primary,
        minWidth: double.maxFinite,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: color?.withOpacity(enabled ? 1 : 0.5) ??
                Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(enabled ? 1 : 0.5),
            width: 3,
          ),
        ),
        // style: ButtonStyle(
        //     // elevation: WidgetStatePropertyAll(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //     side: WidgetStatePropertyAll(BorderSide(
        //       width: 2,
        //     ))),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color?.withOpacity(enabled ? 1 : 0.5) ??
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(enabled ? 1 : 0.5),
                fontSize: 15,
                letterSpacing: 5,
              ),
        ),
      ),
    );
  }
}

// SMOOTH Button
class SmoothButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SmoothButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
    );
  }
}

// Icon Button
class IconDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IconDeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete, color: Colors.white),
      label: const Text("DELETE"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
    );
  }
}

// Icon Circle Button
class IconCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IconCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(20),
      ),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
