// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final bool hassuffixIcon;
  bool obscureText;
  TextInputType? keyboardType;
  void Function(String value)? onChanged;
  FormFieldValidator<String>? validator;
  int? maxLength;
  final bool filled;
  List<TextInputFormatter>? inputFormatters;
  final Color? filledColor;

  FormTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.hassuffixIcon = false,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.filled = false,
    this.filledColor,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        // labelText: "Password",
        filled: widget.filled,
        fillColor: widget.filledColor,
        hintText: widget.hintText,
        // filled: true,
        counter: const SizedBox(
          height: 0,
        ),
        // hintStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.surface,
        // ),
        // labelStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.surface,
        // ),
        // errorStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.onError,
        // ),
        // prefixIconColor: Theme.of(context).colorScheme.surface,
        // focusColor: Theme.of(context).colorScheme.surface,
        // hoverColor: Theme.of(context).colorScheme.surface,
        // suffixIconColor: Theme.of(context).colorScheme.surface,

        prefixIcon: widget.prefixIcon,
        // focusedBorder: OutlineInputBorder(
        //   color: Theme.of(context).colorScheme.
        //   borderRadius: BorderRadius.circular(5.0),
        // ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        suffixIcon: widget.hassuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(widget.obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              )
            : null,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
