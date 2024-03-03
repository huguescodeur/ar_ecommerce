// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthTextfieldWidget extends ConsumerStatefulWidget {
  final TextEditingController controller;
  bool obscureText;
  final String? labelText;
  IconData? iconData;
  final TextInputType keyboardType;
  // final FocusNode? focusNode;
  // final FocusNode? nextFocusNode;
  final VoidCallback? onTap;
  final bool isPassword;
  AuthTextfieldWidget(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.labelText,
      this.onTap,
      this.iconData,
      required this.isPassword,
      required this.keyboardType});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthTextfieldWidgetState();
}

class _AuthTextfieldWidgetState extends ConsumerState<AuthTextfieldWidget> {
  late TextEditingController myController;
  // late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    myController = widget.controller;
  }

  // ? Toggle ObscureText
  void toggleObscureText() {
    // FocusManager.instance.primaryFocus?.unfocus();
    if (widget.isPassword) {
      setState(() {
        widget.obscureText = !widget.obscureText;
        widget.iconData = widget.obscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final obscureText = ref.watch(obscureTextProvider.state);
    return TextField(
        // textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.white,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          filled: true,
          fillColor: const Color(0xff2A2C36).withOpacity(0.5),
          labelText: widget.labelText,
          labelStyle:
              TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.3)),
          suffixIcon: IconButton(
              onPressed: toggleObscureText,
              icon: Icon(
                widget.iconData,
                color: Colors.white,
              )),
        ));
  }
}
