
import 'package:flutter/material.dart';

mixin StandardScreen {

  Color getBackgroundColor() {
    return Colors.red;
  }

  Widget createScreen(Widget widget){
    return AspectRatio(
      aspectRatio: 1.777083333333333,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              repeat: ImageRepeat.repeat,
              image: AssetImage(
                  'assets/implementations/history/background_texture.png'),
            )),
        alignment: Alignment.center,
        child: widget,
      ),
    );
  }
}
