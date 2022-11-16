import 'package:flutter/material.dart';

const int mediumScreenWidth=800;

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  const ResponsiveWidget({required this.desktopScreen,required this.mobileScreen});
  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenWidth;
  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenWidth;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      double width = constraints.maxWidth;
      if(width >= mediumScreenWidth){
        return desktopScreen;
      }
      else{
        return mobileScreen;
      }
    });
  }
}
