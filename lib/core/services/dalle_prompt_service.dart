import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../global/app_constants.dart';
import '../../global/dall_e_res.dart';
import 'db_service.dart';

class DallEPromptService extends ChangeNotifier {
  bool _isLoading = false;
  final Dio _dio = Dio();
  Uint8List? _bytes;

  bool get isLoading => _isLoading;
  Uint8List? get image => _bytes;

  _changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  generateNewImage(
      {required String prompt,
      Resolutions resolutions = Resolutions.high}) async {
    if (_isLoading == true || prompt.isEmpty) return;
    _changeLoadingState();
    try {
      var response = await _dio.post(
        'https://api.openai.com/v1/images/generations',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${AppConstants.BEARER_TOKEN}",
          },
        ),
        data: {
          "prompt": prompt,
          "n": 1,
          "size": resolutions.res,
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        _bytes = await uriToBytes(data['data'][0]['url']);
        LocalDBService().saveImagePrompt(bytes: _bytes!, prompt: prompt);
        _changeLoadingState();
        notifyListeners();
      }
    } catch (err) {
      _changeLoadingState();
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<Uint8List> uriToBytes(String uri) {
    Uri url = Uri.parse(uri);
    return readBytes(url);
  }
}
