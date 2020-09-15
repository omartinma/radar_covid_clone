import 'package:flutter/material.dart';

class ButtonWithBackgroundImage extends StatelessWidget {
  const ButtonWithBackgroundImage({
    Key key,
    this.onTap,
    @required this.text,
  }) : super(key: key);

  final String imageName = "assets/images/button_background.png";
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
          image: AssetImage("assets/images/button_background.png"),
          fit: BoxFit.fill,
          colorFilter: onTap != null
              ? ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.color,
                )
              : ColorFilter.mode(
                  Colors.white.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
