import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_covid_clone/colors.dart';
import 'package:radar_covid_clone/core/controllers/diagnostic_controller.dart';
import 'package:radar_covid_clone/text_styles.dart';
import 'package:radar_covid_clone/ui/common/button_with_background_image.dart';
import 'package:radar_covid_clone/ui/common/platform_dialog.dart';

class SendDiagnosticScreen extends StatelessWidget {
  const SendDiagnosticScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
          context: context,
          builder: (context) {
            return PlatformDialog();
          },
        );
        return result;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          flexibleSpace: Container(
            height: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image(
                image: AssetImage('assets/images/app_bar_shadow.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          toolbarHeight: 60,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MI DIAGNÓSTICO",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(147, 147, 147, 1),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Envía tu diagnóstico\nCOVID positivo",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.title,
                ),
                SizedBox(
                  height: 29.5,
                ),
                Text(
                  "Enviando tu diagnóstico anónimo COVID-19, estás contribuyendo a detener la propagación del virus. ",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.description,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Gracias por ayudarnos a cuidar a los demás.",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.descriptionBold,
                ),
                SizedBox(
                  height: 19.5,
                ),
                Text(
                  "Tu información está segura y será tratada siempre anónimamente.",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.descriptionBold,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Código de diagnóstico",
                            textAlign: TextAlign.start,
                            style: AppTextStyles.descriptionBold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Introduce el código que te han enviado",
                            textAlign: TextAlign.start,
                            style: AppTextStyles.description,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 150),
                        child: Image.asset(
                          "assets/images/send_diagnostic.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                _DiagnosticCodeInput(),
                SizedBox(
                  height: 100,
                ),
                _SendDiagnosticButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiagnosticCodeInput extends StatelessWidget {
  const _DiagnosticCodeInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiagnosticController>();
    var list = controller.inputList;
    List<FocusNode> _focusNodes =
        List<FocusNode>.generate(list.length, (int index) => FocusNode());

    List<Widget> textFields = List<Widget>.generate(
      list.length,
      (int index) => _DigitInput(
        focusNode: _focusNodes[index],
        onChanged: (String value) {
          _checkFocus(index, _focusNodes, list);
          controller.updateValue(value, index);
        },
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: textFields,
      ),
    );
  }

  _checkFocus(
    int index,
    List<FocusNode> focusNodes,
    List<String> list,
  ) {
    if (index < list.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
  }
}

class _DigitInput extends StatelessWidget {
  const _DigitInput({
    Key key,
    this.digit,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
  }) : super(key: key);

  final String digit;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: new Container(
        alignment: Alignment.center,
        height: 35,
        margin: const EdgeInsets.only(right: 3),
        child: TextField(
          cursorWidth: 1,
          onChanged: onChanged,
          autofocus: true,
          showCursor: true,
          maxLength: 1,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          buildCounter: (context, {currentLength, isFocused, maxLength}) {
            return SizedBox(
              height: 0,
              width: 0,
            );
          },
          keyboardType: TextInputType.number,
          maxLengthEnforced: true,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
    );
  }
}

class _SendDiagnosticButton extends StatefulWidget {
  const _SendDiagnosticButton({Key key}) : super(key: key);

  @override
  __SendDiagnosticButtonState createState() => __SendDiagnosticButtonState();
}

class __SendDiagnosticButtonState extends State<_SendDiagnosticButton> {
  @override
  Widget build(BuildContext context) {
    return GetX<DiagnosticController>(
      builder: (controller) {
        return ButtonWithBackgroundImage(
          onTap: controller.sendEnabled.value
              ? () {
                  //Send diagnostic
                }
              : null,
        );
      },
    );
  }
}
