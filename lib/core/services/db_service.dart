import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../global/features.dart';
import '../hive/chat_prompt_model.dart';
import '../hive/hive_chat_prompt_model.dart';
import '../hive/hive_image_prompt_model.dart';

class LocalDBService extends ChangeNotifier {
  Box<HiveChatPromptModel> get chatHistory => _chatBox;
  Box<HiveImagePromptModel> get imageHistory => _imageBox;

  final Box<HiveImagePromptModel> _imageBox = Hive.box('imageBox');
  final Box<HiveChatPromptModel> _chatBox = Hive.box('chatBox');

  ///////////////////////////////////////
  // Saves AI Generated Image To Hive //
  /////////////////////////////////////
  Future<void> saveImagePrompt(
      {required String prompt, required Uint8List bytes}) async {
    HiveImagePromptModel hiveImageModel =
        HiveImagePromptModel(title: prompt, date: DateTime.now(), bytes: bytes);
    await _imageBox.add(hiveImageModel);
  }

  /////////////////////////////////
  // Saves Chat History To Hive //
  ///////////////////////////////
  Future<bool> saveChatHistory(
      {required String title, required List<ChatPromptModel> chat}) async {
    HiveChatPromptModel hivePromptModel =
        HiveChatPromptModel(title: title, date: DateTime.now(), chat: chat);
    await _chatBox.add(hivePromptModel);
    return true;
  }

  /////////////////////////////
  // Deletes Item From Hive //
  ///////////////////////////
  Future<void> deletePrompt({required Features feature, required key}) async {
    switch (feature) {
      case Features.CHAT_GPT:
        await _chatBox.delete(key);
        break;
      case Features.DALL_E_2:
        await _imageBox.delete(key);
        break;
      default:
    }
    notifyListeners();
  }
}
