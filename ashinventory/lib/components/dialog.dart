// ../../washking/washking/lib/components/dialog.dart
import 'package:flutter/material.dart';
import 'package:ashinventory/components/button.dart';

class PopupDialog extends StatelessWidget {
  final String title;
  final Widget message;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool showTitle;
  final bool showCancel;
  final bool showConfirm;
  final String? cancelText;
  final String? confirmText;

  const PopupDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onCancel,
    required this.onConfirm,
    required this.showTitle,
    required this.showCancel,
    required this.showConfirm,
    this.confirmText = "Confirm",
    this.cancelText = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: showTitle ? Text(title,style:  TextStyle(
                                color: Theme.of(context).colorScheme.primary
                              ),) : null,
      content: message,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actions: !showCancel && !showConfirm
          ? null
          : <Widget>[
              showCancel
                  ? TextButton(
                      onPressed: onCancel,
                      child: Text(
                        cancelText ?? "Cancel",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error
                        ),
                      ),
                    )
                  : const SizedBox(),
              showCancel
                  ? SmoothButton(
                      onPressed: onConfirm,
                      
                      text: confirmText ?? "Confirm",
                    )
                  : const SizedBox(),
            ],
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final String? actionText;
  final VoidCallback? onAction;
  final ScrollController scrollController;
  final bool full;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.actionText,
    required this.onAction,
    required this.scrollController,
    required this.full,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    if (widget.actionText != null) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            widget.content,
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: widget.onAction,
                child: Text(widget.actionText!),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: widget.content),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
