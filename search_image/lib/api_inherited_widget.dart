import 'package:flutter/material.dart';
import 'package:search_image/pixabay_api_view_model.dart';

class ApiInheritedWidget extends InheritedWidget {
  final PixabayApiViewModel dataModel;

  const ApiInheritedWidget(
      {Key? key, required this.dataModel, required Widget child})
      : super(key: key, child: child);

  static ApiInheritedWidget of(BuildContext context) {
    final ApiInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<ApiInheritedWidget>();
    assert(result != null, 'No ApiInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ApiInheritedWidget oldWidget) {
    return true;
  }
}
