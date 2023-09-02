import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:apitemplate/constants/app_boxes.dart';

class AppLocal {
  static final AppLocal instance = AppLocal._internal();
  AppLocal._internal();

  Future initStorage() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    for (var box in AppBoxes.boxList) {
      await Hive.openBox(box);
    }
  }

  Box box(String box) => Hive.box(box);
}
