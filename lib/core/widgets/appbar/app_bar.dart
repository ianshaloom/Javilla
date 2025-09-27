import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../helpers/helper_functions.dart';

class NoHeightAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NoHeightAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HelperFunctions.isDarkMode(context)
          ? Color(0xFF1C1F22)
          : Color(0xFFE7EAED),
      toolbarHeight: 0,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Custom appbar for achieving a desired design goal.
  /// - Set [title] for a custom title.
  /// - [showBackArrow] to toggle the visibility of the back arrow.
  /// - [leadingIcon] for a custom leading icon.
  /// - [leadingOnPressed] callback for the leading icon press event.
  /// - [actions] for adding a list of action widgets.
  /// - Horizontal padding of the appbar can be customized inside this widget.
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.bottom,
    this.toolbarHeight = 56,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackArrow
          ? IconButton(
              onPressed: leadingOnPressed ?? () => Get.back(),
              icon: Icon(Iconsax.arrow_left, color: color.onSurface),
            )
          : leadingIcon != null
          ? IconButton.filled(
              onPressed: leadingOnPressed,
              icon: Icon(leadingIcon),
              style: IconButton.styleFrom(backgroundColor: Color(0xFFF4F3FF)),
            )
          : null,
      title: title,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
