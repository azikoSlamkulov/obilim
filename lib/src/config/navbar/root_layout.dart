import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'adaptive_navigation.dart';
import 'navigation_items.dart' as my_des;

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.currentIndex,
    //required this.title,
  });

  final Widget mobile;
  final Widget tablet;
  final int currentIndex;
  //final String title;
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        void onSelectTab(int index) {
          final destination = my_des.destinations[index];
          context.go(destination.route);
        }

        return AdaptiveNavigation(
          key: _navigationRailKey,
          selectedIndex: currentIndex,
          //title: title,
          onDestinationSelected: onSelectTab,
          destinations: my_des.destinations
              .map<NavigationDestination>(
                (e) => NavigationDestination(
                  icon: e.icon!,
                  label: e.label,
                  selectedIcon: e.selectedIcon,
                ),
              )
              .toList(),
          mobile: mobile,
          tablet: tablet,
        );
      },
    );
  }
}
