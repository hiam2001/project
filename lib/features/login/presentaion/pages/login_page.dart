import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Stack( //stack helps to overlaps widgets
        children: [

          Positioned( //helps to position widget where ever we want
           top:-70, //position at the bottom
            right:-13, //value of right from animation controller
            child: Transform.rotate(
              angle: 3.3,
              child: ClipPath(
                clipper: MyWaveClipper(), //applying our custom clipper
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.orangeAccent.withOpacity(0.3),
                    width: 900,
                    height: 200,
                  ),
                ),
              ),
            ),

          ),
      Positioned( //helps to position widget where ever we want
          top:-50, //position at the bottom
          right:-13, //value of right from animation controller
          child: Transform.rotate(
            angle: -3.3,
            child: ClipPath(
              clipper: MyWaveClipper(), //applying our custom clipper
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.orangeAccent.withOpacity(0.5),
                  width: 900,
                  height: 200,
                ),
              ),
            ),
          ),
      )
        ]),
    ),
    );
  }
}

//our custom clipper with Path class
class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    //see my previous post to understand about Bezier Curve waves
    // https://www.hellohpc.com/flutter-how-to-make-bezier-curve-waves-using-custom-clippath/

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

