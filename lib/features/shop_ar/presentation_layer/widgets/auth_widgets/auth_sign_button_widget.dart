// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

// class AuthSignButtonWidget extends StatelessWidget {
//   final String text;
//   final Function()? onTap;
//   // final FocusNode? focusNode;
//   const AuthSignButtonWidget({
//     super.key,
//     required this.text,
//     this.onTap,
//     // required this.focusNode
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       child: ElevatedButton(
//           // focusNode: focusNode,
//           style: const ButtonStyle(
//               backgroundColor: MaterialStatePropertyAll(Colors.red)),
//           onPressed: onTap,
//           child: Text(
//             text,
//             style: const TextStyle(color: Colors.white, fontSize: 25),
//           )),
//     );
//   }
// }

class AuthSignButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isLoading;

  const AuthSignButtonWidget({
    Key? key,
    required this.text,
    this.onTap,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.red,
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
      ),
    );
  }
}
