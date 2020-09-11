import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_covid_clone/ui/common/button_with_background_image.dart';
import 'package:radar_covid_clone/ui/common/container_with_background_image.dart';

class ExposureScreen extends StatelessWidget {
  const ExposureScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _ExposureImage(),
          _ExposureButtonInformation(),
          _RadarContainer(),
          Spacer(),
          ButtonWithBackgroundImage(),
        ],
      ),
    );
  }
}

class _ExposureImage extends StatelessWidget {
  const _ExposureImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        height: context.height * 0.38,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/exposure_home_background.png",
                width: context.width,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Image.asset(
                  "assets/images/exposure_home_image.png",
                  width: context.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExposureButtonInformation extends StatelessWidget {
  const _ExposureButtonInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      child: ContainerWithBackgroundImage(
        backgroundImage: "assets/images/exposure_low_background.png",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Exposición baja",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromARGB(255, 88, 176, 106)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Te informaremos en el caso de un posible contacto de riesgo",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadarContainer extends StatelessWidget {
  const _RadarContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWithBackgroundImage(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Radar COVID activo",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                    value: true,
                    onChanged: (value) {
                      print("changed");
                    }),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Las interacciones con móviles cercanos se registrarán siempre anónimamente.",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
