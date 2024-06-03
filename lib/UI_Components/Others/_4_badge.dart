import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final bool isAdmin;
  final int value;

  const MyBadge({
    super.key,
    required this.isAdmin,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 35,
            margin: const EdgeInsets.all(5),
            child: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Theme.of(context).focusColor.withOpacity(0.5),
            ),
          ),
          if (value > 0)
            Positioned(
              top: 2,
              right: 15,
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 10,
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
