import 'package:flutter/material.dart';

class ContainerWithBackgroundImage extends StatelessWidget {
  const ContainerWithBackgroundImage({
    Key key,
    @required this.child,
    this.backgroundImage,
  }) : super(key: key);

  final Widget child;
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage ??
                  "assets/images/white_rectangle_background.png"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
            top: 15,
            bottom: 15,
          ),
          child: child,
        ));
  }
}
