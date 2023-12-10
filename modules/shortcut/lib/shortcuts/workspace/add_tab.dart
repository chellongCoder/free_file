import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:utils/constants/constants.dart';

class AddTabAction extends Action<AddTabIntent> {
  AddTabAction();

  @override
  void invoke(covariant AddTabIntent intent) {
    injector<EventBus>().fire(
      const AddTabEvent(),
    );
  }
}

class AddTabIntent extends Intent {
  static LogicalKeySet? get keySet => kIsMacOs
      ? WorkspaceActions.addTabMacOs.keySet
      : WorkspaceActions.addTab.keySet;
}
