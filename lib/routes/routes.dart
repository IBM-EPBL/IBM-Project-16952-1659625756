import 'package:ledgerfe/login/mobile_view.dart' as login_mobile;
import 'package:ledgerfe/login/desktop_view.dart' as login_desktop;
import 'package:ledgerfe/timeline/mobile_view.dart' as timeline_mobile;
import 'package:ledgerfe/timeline/desktop_view.dart' as timeline_desktop;
import 'package:flutter/material.dart';
import 'package:ledgerfe/global_utilities/responsive_widget.dart';

class RouteManager {
  static const String loginPage = '/timeline';
  static const String timelinePage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const ResponsiveWidget(
            mobileScreen: login_mobile.MobileView(),
            desktopScreen: login_desktop.DesktopView(),
          ),
        );
      case timelinePage:
        return MaterialPageRoute(
            builder: (context) => const ResponsiveWidget(
              mobileScreen: timeline_mobile.MobileView(),
              desktopScreen: timeline_desktop.DesktopView(),
            ),
        );
      default:
        throw const FormatException("Route not found");
    }
  }
}