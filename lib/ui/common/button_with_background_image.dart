import 'package:flutter/material.dart';

class ButtonWithBackgroundImage extends StatelessWidget {
  const ButtonWithBackgroundImage({Key key}) : super(key: key);

  final String imageName = "assets/images/button_background.png";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: AssetImage("assets/images/button_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: InkWell(
          onTap: () => print(""),
          child: Container(
            height: 40,
            child: Center(
              child: Text(
                "Comunica tu positivo COVID-19",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
