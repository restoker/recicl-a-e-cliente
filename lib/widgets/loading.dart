import 'package:flutter/material.dart';
import 'package:reciclae/utils/my_colors.dart';

class Loading {
  static Future<void> show(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width * 0.25;
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            width: ancho,
            height: 5,
            child: LinearProgressIndicator(
              semanticsLabel: 'Cargando...',
              minHeight: 4.0,
              color: MyColors.colorprimario,
            ),
          ),
        ),
      ),
    );
  }
}
