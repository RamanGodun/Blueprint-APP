import 'package:flutter/cupertino.dart';

class AnimationService {
  late AnimationController controller;

  void init(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: vsync,
    );
  }

  void dispose() {
    controller.dispose();
  }

  Animation<double> get animation => controller;
}
