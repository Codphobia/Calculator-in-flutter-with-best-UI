import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  late final color;
  late final txtColor;
  late final  buttonText;
final buttonOntaped;
  MyButton({this.color, this.txtColor, this.buttonText,this.buttonOntaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOntaped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: txtColor,fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
