import 'package:flutter/material.dart';
import 'models 4 interviewer app/inherit_model.dart';

class InheritedModelProvider extends InheritedWidget {
  final InheritModel stateOfInheritedModel;

  const InheritedModelProvider({
    super.key,
    required super.child,
    required this.stateOfInheritedModel,
  });

  static InheritModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedModelProvider>()
        ?.stateOfInheritedModel;
  }

  @override
  bool updateShouldNotify(InheritedModelProvider oldWidget) =>
      oldWidget.stateOfInheritedModel != stateOfInheritedModel;
}

// updateShouldNotifyDependent -- for partial renewing (work with "aspect" parameter)

 
/*
access to inherited data like next
   void getDataFromInherit() {
// next with subscription (like "listen: true" in Provider)
    context
        .dependOnInheritedWidgetOfExactType<DataProviderInherit>()
        ?.appState
        .isCurrentAnswerCorrect;
// next without subscription (like "listen: false" in Provider)
    final element =
        context.getElementForInheritedWidgetOfExactType<DataProviderInherit>();
    final dataProvider = element?.widget as DataProviderInherit;
    dataProvider.appState.currentQuestion;
// or with helper method
    getInherit<DataProviderInherit>(context)?.appState.currentQuestion;
  }

// next method from Helper Class
  T? getInherit<T>(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<DataProviderInherit>();
    final widget = element?.widget;
    if (widget is T) {
      return widget as T;
    } else {
      return null;
    }
  }
 */



