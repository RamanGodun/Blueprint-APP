import 'package:flutter/material.dart';

import '../../State_management/Src/Generated_code/by spider/resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ThisAppImages.downloadPicture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ThisAppImages.apple),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
