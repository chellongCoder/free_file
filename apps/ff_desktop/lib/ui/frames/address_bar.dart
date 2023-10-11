import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme.dart';
import 'package:utils/utils.dart';
import 'package:ff_desktop/features/features.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.d40,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(
          Spacing.d8,
        ),
      ),
      margin: EdgeInsets.all(
        Spacing.d4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.d8,
      ),
      child: AnimatedSize(
        curve: Curves.easeOut,
        duration: FludaDuration.ms3,
        child: Selector<ExploreViewModel, Uri>(
          selector: (BuildContext context, ExploreViewModel model) {
            return model.currentUri;
          },
          builder: (BuildContext context, Uri uri, _) {
            return Text(
              uri.toFilePath(),
              style: context.theme.textTheme.bodyLarge?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ),
    );
  }
}
