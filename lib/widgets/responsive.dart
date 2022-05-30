import 'package:flutter/material.dart';

class Responsive extends StatelessWidget{
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;
  
  Responsive({
    required this.desktop,
    this.tablet,
    required this.mobile,
});

  static bool isMobile (BuildContext context) => MediaQuery.of(context).size.width < 800 ;
  static bool isTablet (BuildContext context) => MediaQuery.of(context).size.width < 1200 &&   MediaQuery.of(context).size.width>=800 ;
  static bool isDesktop (BuildContext context) =>   MediaQuery.of(context).size.width>=1200 ;
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder: (context,constraint)
    {
      if(constraint.maxWidth >=1200)
        return desktop;
      if(constraint.maxWidth >=1200)
        return tablet?? mobile;
      else
        return mobile;

    });
    
  }
  
  
}