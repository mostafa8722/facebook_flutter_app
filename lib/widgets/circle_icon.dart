

import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget{

  final double iconSize;
  final IconData? icon;
  final Color? color;
  final  onTap;


      CircleIcon({
    required this.icon,required this.iconSize,this.onTap,this.color
});
  @override
  Widget build(BuildContext context) {

    return
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7),

          decoration: BoxDecoration(
              shape: BoxShape.circle
          ),
          child: Icon(icon,color:color?? Colors.black ,),
        ),
      );
  }
}