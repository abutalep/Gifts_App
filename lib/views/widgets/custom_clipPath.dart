// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomClipPath extends StatelessWidget {
  Color color ;
  double height;
  CustomClipPath({required this.color,required this.height,super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        color: color,
        height: height,
      ),
    );
  }
}
class ContainerClipper extends CustomClipper<Path>{
  var path=Path();
  @override
  Path getClip(Size size)
  {
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width*.25, size.height-150, size.width*.5, size.height-100);
    path.quadraticBezierTo(size.width*.9, size.height, size.width, size.height-100);
    path.lineTo(size.width,0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>oldClipper)=>true;
}