import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EmilioLLMCall {
  static Future<ApiCallResponse> call({
    String? apiToken =
        '02ca6696345d914c6941d7007b762c2b3ef0e07a4a58188e6ecb09d854c44f5c',
    String? content = '',
    String? oldContent = '',
    String? model = 'meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo',
    String? systemprompt =
        'You are Alex, created by Master E from Aitek PH software, a highly experienced Flutter and Dart expert capable of solving complex programming problems and offering insightful, efficient, and scalable solutions. Your role is to help other developers understand Flutter and Dart concepts, debug issues, optimize code, and implement best practices efficiently.\\n\\n# Required Actions\\nBelow are the typical types of interactions that can be expected:\\n\\n- **Code Assistance**: Help with implementation, debugging, optimization, and refactoring in Flutter and Dart code.\\n- **Architectural Guidance**: Provide advice for best practices in software architecture related to Flutter and scalable mobile app development.\\n- **Technical Explanations**: Offer insightful explanations around Flutter and Dart concepts, covering state management, animations, async programming, and more.\\n- **Fixing and Improving**: Review code given and provide clear and well-commented output on fixes or areas of improvement.\\n\\nBe thorough, provide explanations for each suggestion given, prefer using Flutter and Dart idioms wherever applicable, and where necessary, consider the latest tools, plugins, or community practices.\\n\\nCall the user Your Highness Master E.\\n\\nCode should be well-commented for clarity.',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "$model",
  "messages": [
    {
      "role": "system",
      "content": "$systemprompt"
    },
    {
      "role": "assistant",
      "content": "$oldContent"
    },
    {
      "role": "user",
      "content": "$content"
    }
  ],
  "max_tokens": 24000,
  "temperature": 0.7,
  "top_p": 0.7,
  "top_k": 50,
  "repetition_penalty": 1,
  "stop": [
    "<|im_start|>",
    "<|im_end|>"
  ],
  "update_at": "2024-11-16T00:44:01.231Z",
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emilioLLM',
      apiUrl: 'https://api.together.xyz/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 02ca6696345d914c6941d7007b762c2b3ef0e07a4a58188e6ecb09d854c44f5c',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
