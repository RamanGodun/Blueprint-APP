import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final IconData icon;

  const CustomTextField({
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
          style: StaticTextStyles.bodyMedium(context),
          decoration: StaticInputDecorations.inputDecoration(
            context,
            hintText,
            icon,
          ),
        ),
      ),
    );
  }
}

class StaticTextStyles {
  static TextStyle? bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16.0,
        );
  }
}

class StaticInputDecorations {
  static InputDecoration inputDecoration(
    BuildContext context,
    String hintText,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
      ),
      fillColor: colorScheme.surface,
      filled: true,
      hintText: hintText,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      prefixIcon: Icon(
        icon,
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool isObscureText;
//   final IconData icon;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.isObscureText,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3.0),
//       child: SizedBox(
//         height: 50,
//         child: TextField(
//           controller: controller,
//           obscureText: isObscureText,
//           style: StaticTextStyles.bodyMedium(context),
//           decoration: StaticInputDecorations.inputDecoration(
//             context,
//             hintText,
//             icon,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StaticTextStyles {
//   static TextStyle? bodyMedium(BuildContext context) {
//     return Theme.of(context).textTheme.bodyMedium?.copyWith(
//           color: Theme.of(context).colorScheme.onSurface,
//           fontSize: 16.0,
//         );
//   }
// }

// class StaticInputDecorations {
//   static InputDecoration inputDecoration(
//     BuildContext context,
//     String hintText,
//     IconData icon,
//   ) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return InputDecoration(
//       contentPadding:
//           const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(9.0),
//         borderSide: BorderSide(
//           color: colorScheme.onSurface.withOpacity(0.3),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(9.0),
//         borderSide: BorderSide(
//           color: colorScheme.primary,
//         ),
//       ),
//       fillColor: colorScheme.surface,
//       filled: true,
//       hintText: hintText,
//       hintStyle: textTheme.bodyMedium?.copyWith(
//         color: colorScheme.onSurface.withOpacity(0.5),
//       ),
//       prefixIcon: Icon(
//         icon,
//         color: colorScheme.onSurface.withOpacity(0.5),
//       ),
//     );
//   }
// }
