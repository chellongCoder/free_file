import 'package:core_ui/core_ui.dart';
import 'package:ff_desktop/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ff_desktop/features/features.dart';
import 'package:theme/theme.dart';
import 'package:utils/utils.dart';

class SideBarTreeView extends StatelessWidget {
  final TreeExploreViewModel model;

  const SideBarTreeView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      builder: (context, _) {
        return Selector<TreeExploreViewModel, bool>(
          selector: (context, model) => model.isExpanded,
          builder: (context, isExpanded, _) {
            return Padding(
              padding: EdgeInsets.only(
                left: model.level > 0 ? Spacing.d16 : 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<ExploreViewModel>(
                    builder: (context, exploreViewModel, _) {
                      return SideBarItem(
                        title: model.directory.name,
                        uri: model.directory.path,
                        onTap: () {
                          if (!model.isExpanded) {
                            model.toggle();
                          }
                          exploreViewModel.goTo(model.directory.path);
                        },
                        selected: exploreViewModel.currentUri.trim() ==
                            model.directory.path.trim(),
                        icon: model.isExpanded && model.isExpandable
                            ? Assets.icons.filesAndFolder.outline.folder
                            : Assets.icons.filesAndFolder.outline.folder03,
                        selectedIcon: model.isExpanded && model.isExpandable
                            ? Assets.icons.filesAndFolder.solid.folder
                            : Assets.icons.filesAndFolder.solid.folder03,
                        iconColor: model.directory.getEntityColor(context),
                        expanded: isExpanded,
                        expandable: model.isExpandable,
                        onToggleExpand: () {
                          model.toggle();
                        },
                      );
                    },
                  ),
                  if (isExpanded)
                    for (final directory in model.directories)
                      SideBarTreeView(
                        model: directory,
                      ),
                  if (isExpanded)
                    for (final file in model.files)
                      Padding(
                        padding: EdgeInsets.only(
                          left: Spacing.d16,
                        ),
                        child: SideBarItem(
                          title: file.name,
                          uri: file.path,
                          onTap: () {},
                          icon: file.icon,
                          iconColor: file.getEntityColor(context),
                        ),
                      ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
