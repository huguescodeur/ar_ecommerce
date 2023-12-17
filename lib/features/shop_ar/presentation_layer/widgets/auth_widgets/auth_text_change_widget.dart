import 'package:flutter/material.dart';

class AuthTextChangeWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function()? onTap;
  const AuthTextChangeWidget(
      {super.key, required this.text, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
                letterSpacing: 2.2),
          ),
          IconButton(
            focusNode: null,
            padding: EdgeInsets.zero,
            onPressed: onTap,
            icon: Icon(
              iconData,
              size: 38,
            ),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
