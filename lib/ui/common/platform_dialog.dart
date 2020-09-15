import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlatformDialog extends StatelessWidget {
  const PlatformDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Text("¿seguro que no quieres enviar tu diagnóstico?");
    var ok = Text("OK");
    var okAction = () => Get.back(result: true);
    var cancel = Text("Cancelar");
    var cancelAction = () => Get.back(result: false);
    var content = Text("Por favor ....");
    return Platform.isAndroid
        ? AlertDialog(
            title: title,
            content: content,
            actions: [
              FlatButton(
                onPressed: okAction,
                child: ok,
              ),
              FlatButton(
                onPressed: cancelAction,
                child: cancel,
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: title,
            actions: [
              CupertinoDialogAction(
                child: ClipRRect(
                  child: Container(
                    child: ok,
                    width: 100,
                    color: Colors.blue,
                  ),
                ),
                onPressed: okAction,
                textStyle: TextStyle(backgroundColor: Colors.amber),
              ),
              CupertinoDialogAction(
                child: cancel,
                onPressed: cancelAction,
              ),
            ],
          );
  }
}
