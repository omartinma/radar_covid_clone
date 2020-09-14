import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:radar_covid_clone/colors.dart';
import 'package:radar_covid_clone/core/controllers/exposure_controller.dart';
import 'package:radar_covid_clone/core/models/exposure.dart';
import 'package:radar_covid_clone/ui/common/button_with_background_image.dart';
import 'package:radar_covid_clone/ui/common/container_with_background_image.dart';
import 'package:radar_covid_clone/ui/send_diagnostic/send_diagnostic_screen.dart';

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
          ButtonWithBackgroundImage(onTap: () {
            /*Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => SendDiagnosticScreen()));*/
            Get.to(
              SendDiagnosticScreen(),
              duration: Duration(milliseconds: 100),
              transition: Transition.native,
            );
          }),
        ],
      ),
    );
  }
}

class _ExposureImage extends StatelessWidget {
  const _ExposureImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ExposureController>(
      builder: (controller) {
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
                    color: controller.isRadarActive.value
                        ? null
                        : AppColors.disableImage,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ColorFiltered(
                    colorFilter: controller.isRadarActive.value
                        ? ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.color,
                          )
                        : AppColors.greyScale,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Image.asset(
                        "assets/images/exposure_home_image.png",
                        width: context.width,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ExposureButtonInformation extends StatelessWidget {
  const _ExposureButtonInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ExposureController>(
      builder: (exposureController) {
        var child;
        String backgroundImage;
        if (exposureController.exposure.value.exposureLevel == null) {
          child = Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CircularProgressIndicator(),
          );
        } else {
          Color color;
          String expositionMessage;
          switch (exposureController.exposure.value.exposureLevel) {
            case ExposureLevel.HIGH:
              backgroundImage = "assets/images/exposure_high_background.png";
              color = Colors.red;
              expositionMessage = "alta";
              break;
            case ExposureLevel.MEDIUM:
              backgroundImage = "assets/images/exposure_medium_background.png";
              color = Colors.orange;
              expositionMessage = "media";
              break;
            case ExposureLevel.LOW:
              backgroundImage = "assets/images/exposure_low_background.png";
              color = Color.fromARGB(255, 88, 176, 106);
              expositionMessage = "baja";
              break;
            default:
          }
          child = Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exposición $expositionMessage",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: color),
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
          );
        }

        return Container(
          height: 120,
          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
          child: ContainerWithBackgroundImage(
            backgroundImage: backgroundImage,
            child: child,
          ),
        );
      },
    );
  }
}

class _RadarContainer extends StatelessWidget {
  const _RadarContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ExposureController>(
      builder: (controller) {
        return ContainerWithBackgroundImage(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Radar COVID " +
                        (controller.isRadarActive.value
                            ? "activo"
                            : "inactivo"),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch.adaptive(
                        value: controller.isRadarActive.value,
                        inactiveTrackColor: AppColors.customRed,
                        onChanged: (value) {
                          controller.changeRadarActive();
                        }),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                controller.isRadarActive.value
                    ? "Las interacciones con móviles cercanos se registrarán siempre anónimamente."
                    : "Por favor, activa esta opción para que la aplicación funcione",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: controller.isRadarActive.value
                        ? Colors.black
                        : AppColors.customRed),
              ),
            ],
          ),
        );
      },
    );
  }
}
