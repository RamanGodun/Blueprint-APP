import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: isObscureText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
            prefixIcon: Icon(icon,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
