// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:mobile_gpt/core/hive/chat_prompt_model.dart';
import 'package:mobile_gpt/core/services/db_service.dart';

import '../../global/app_constants.dart';

class ChatGPTPromptService extends ChangeNotifier {
  bool _responding = false;
  final Dio _dio = Dio();

  final List<ChatPromptModel> _promptChat = [];
  List<ChatPromptModel> get chat => _promptChat;
  List _answers = [];
  bool get responding => _responding;

  _changeLoadingState() {
    _responding = !_responding;
    notifyListeners();
  }

  sendPrompt({required String prompt}) async {
    if (_responding == true || prompt.isEmpty) return;
    _changeLoadingState();
    try {
      _sendNewTextToChatGPT(text: prompt, sender: "user");
      //_answers array is history data to send back to Chat-GPT for conversation continuity
      _answers.add({"role": "user", "content": prompt});

      var response = await _dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${AppConstants.BEARER_TOKEN}",
          },
        ),
        data: {
          "model": AppConstants.CHAT_GPT_MODEL,
          "messages": _answers,
        },
      );
      if (response.statusCode == 200) {
        String content = response.data['choices'][0]['message']['content']
            .toString()
            .trim()
            .replaceAll('\n', '');
        _sendNewTextToChatGPT(text: content, sender: "assistant");
        _answers.add({"role": "assistant", "content": content});
        _changeLoadingState();
        notifyListeners();
      }
    } on DioError catch (err) {
      print(_answers);
      if (kDebugMode) {
        print("catch $err");
      }

      _changeLoadingState();
    }
  }

  clearChat() {
    _promptChat.clear();
    _answers.clear();
    notifyListeners();
  }

  //chat history to array
  _chatHistory() {
    List<ChatPromptModel> chat = [];
    var chatArray = chat.map((c) => {"role": c.sender, "message": c.text});
  }

  /////////////////////////////////
  // Saves Chat History To Hive //
  ///////////////////////////////
  void _sendNewTextToChatGPT({required String text, required String sender}) {
    ChatPromptModel prompt =
        ChatPromptModel(text: text, sender: sender, date: DateTime.now());
    _promptChat.add(prompt);
    notifyListeners();
  }
}
