import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/progress/step/progress_step.dart';
import 'package:flutter/material.dart';

class DSAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  DSAppBarWidget({
    super.key,
    IconData? iconLeading,
    void Function()? onPressedIconLeading,
    DSAppBarType type = DSAppBarType.light, 
    double? max,
    double? current,
    IconData? menuItem,
    void Function()? onPressedMenuItem,
  }) : props = DSAppBarProps(
      iconLeading: iconLeading,
      menuItem: menuItem,
      type: type,
      max: max,
      current: current,
      onPressedIconLeading: onPressedIconLeading,
      onPressedMenuItem: onPressedMenuItem
  );

  final DSAppBarProps props;
  final appBarStyle = DSAppBarStyle();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: appBarStyle.getBackgroundColor(props.type),
        elevation: 0,
        leading: props.iconLeading == null
            ? null
            : IconButton(
                icon: Icon(
                  props.iconLeading,
                  color: appBarStyle.getIconColor(props.type),
                  size: appBarStyle.sizeIcon,
                ),
                onPressed: () => {
                  props.onPressedIconLeading?.call()
                },
              ),
        title: (props.current !=null && props.max != null) ?
          SizedBox(
              width: double.infinity,
              child:
              DSProgressStepWidget(
                  currentPage: props.current!.toInt(),
                  totalPages: props.max!.toInt()
              ),
            ) : null,
            actions: props.menuItem != null ? [
              Padding(
                padding: EdgeInsets.only(
                    right: appBarStyle.token.spacing.xs,
                ),
                child: IconButton(
                    icon: Icon(
                      props.menuItem,
                      color: appBarStyle.getIconColor(props.type),
                      size: appBarStyle.sizeIcon,
                    ),
                    onPressed: () => {
                      props.onPressedMenuItem?.call()
                    },
                  )
              )] : []);
  }
}
