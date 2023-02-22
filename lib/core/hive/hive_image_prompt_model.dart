import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

part 'hive_image_prompt_model.g.dart';

@HiveType(typeId: 2)
class HiveImagePromptModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  Uint8List? bytes;
  HiveImagePromptModel({this.title, this.date, this.bytes});
}
