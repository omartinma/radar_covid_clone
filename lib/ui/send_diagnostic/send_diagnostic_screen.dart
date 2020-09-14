import 'package:flutter/material.dart';
import 'package:radar_covid_clone/text_styles.dart';

class SendDiagnosticScreen extends StatelessWidget {
  const SendDiagnosticScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
