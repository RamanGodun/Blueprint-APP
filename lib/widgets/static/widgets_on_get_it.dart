import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class StaticWidgetsOnGetIt {
  StaticWidgetsOnGetIt._internal();

  static final StaticWidgetsOnGetIt _instance =
      StaticWidgetsOnGetIt._internal();

  factory StaticWidgetsOnGetIt() => _instance;

  final Widget _loadingWidget = _buildLoadingWidget();

  static Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 15.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget get loadingWidget => _loadingWidget;

  Widget getCustomLoadingWidget({double? radius, Color? color}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: radius ?? 15.0,
            color: color ?? Colors.blue,
          ),
        ],
      ),
    );
  }
}
