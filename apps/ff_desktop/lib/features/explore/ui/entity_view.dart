import 'dart:math';

import 'package:ff_desktop/features/explore/explore.dart';
import 'package:ff_desktop/ui/ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:ff_desktop/constants/constants.dart';
import 'package:theme/theme.dart';
import 'package:utils/utils.dart';

part 'view_modes/list.dart';

class EntityView extends StatelessWidget {
  final ViewMode mode;
  final ScrollController scrollController;

  final List<Entity> entities;
  final Set<Entity> Function() selectedEntitiesGetter;
  final Set<Entity> Function() copiedEntitiesGetter;

  final ValueChanged<Set<Entity>> onSelectionChanged;
  final ValueChanged<Entity> onEntityTap;
  final ValueChanged<Entity> onEntityDoubleTap;

  final Function(EntityContextAction action)? onAction;

  const EntityView({
    super.key,
    this.mode = ViewMode.list,
    required this.scrollController,
    required this.entities,
    required this.selectedEntitiesGetter,
    required this.copiedEntitiesGetter,
    required this.onSelectionChanged,
    required this.onEntityTap,
    required this.onEntityDoubleTap,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context); // rebuild on resize.
    switch (mode) {
      case ViewMode.columns:
      case ViewMode.details:
      case ViewMode.grid:
      case ViewMode.list:
      default:
        return EntityViewList(
          scrollController: scrollController,
          entities: entities,
          selectedEntitiesGetter: selectedEntitiesGetter,
          copiedEntitiesGetter: copiedEntitiesGetter,
          onSelectionChanged: onSelectionChanged,
          onEntityTap: onEntityTap,
          onEntityDoubleTap: onEntityDoubleTap,
          onAction: onAction,
        );
    }
  }
}
