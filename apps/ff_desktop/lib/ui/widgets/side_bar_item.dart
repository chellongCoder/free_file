import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:utils/utils.dart';

class SideBarItem extends StatelessWidget {
  final String? title;
  final Uri? uri;
  final VoidCallback? onTap;

  final bool selected;

  final SvgGenImage? icon;
  final SvgGenImage? selectedIcon;
  final TextStyle? textStyle;

  final Widget? suffix;

  const SideBarItem({
    super.key,
    this.title,
    this.uri,
    this.onTap,
    this.icon,
    this.selectedIcon,
    this.textStyle,
    this.selected = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.d32,
      margin: EdgeInsets.symmetric(
        horizontal: Spacing.d12,
      ),
      child: Tappable(
        mouseCursor: SystemMouseCursors.click,
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: selected
                ? context.theme.colorScheme.surface.withTransparency
                : null,
            borderRadius: BorderRadius.circular(Spacing.d4 + Spacing.d2),
          ),
          child: Row(
            children: [
              SizedBox(width: Spacing.d8),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Spacing.d4,
                ),
                child: ImageView(
                  selected ? selectedIcon : icon,
                  size: Spacing.d20,
                  color: selected
                      ? context.theme.primaryColor
                      : context.theme.iconTheme.color,
                ),
              ),
              SizedBox(width: Spacing.d8),
              Expanded(
                child: Text(
                  title ?? uri?.lastNonEmptySegment ?? '',
                  style: (textStyle ?? context.theme.textTheme.bodyLarge)
                      ?.copyWith(
                    color: selected ? context.theme.primaryColor : null,
                    fontWeight: selected ? FontWeight.w700 : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (suffix != null) suffix!,
              if (selected)
                Container(
                  height: Spacing.d32,
                  width: Spacing.d4 + Spacing.d2,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Spacing.d4 + Spacing.d2),
                      bottomRight: Radius.circular(Spacing.d4 + Spacing.d2),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
