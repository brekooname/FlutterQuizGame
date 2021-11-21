import 'dart:io' as io;
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

import '../../Components/Game/game.dart';
import '../../Constants/contrast.dart';

class FileUtil {
  static Future<String> loadText(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString(
        'implementations/history/questions/en/diff0/questions_diff0_cat0.txt');
  }

}
