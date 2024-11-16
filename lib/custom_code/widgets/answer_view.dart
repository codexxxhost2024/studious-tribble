// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AnswerView extends StatefulWidget {
  const AnswerView({
    super.key,
    this.width,
    this.height = double.infinity,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<AnswerView> createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? audioFilePath;

  @override
  void initState() {
    super.initState();
    _convertTextToSpeech(widget.text);
  }

  Future<void> _convertTextToSpeech(String text) async {
    final response = await http.post(
      Uri.parse('https://api.neets.ai/v1/tts'),
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key':
            '7d088e55e5ad4db1846e9511259418f0', // Replace with your actual API key
      },
      body: jsonEncode({
        'text': text,
        'voice_id': 'us-male-2',
        'params': {
          'model': 'style-diff-500',
        },
      }),
    );

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/tts_audio.mp3';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      audioFilePath = filePath;

      // Autoplay the audio
      _playAudio();
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  void _playAudio() async {
    if (audioFilePath != null) {
      int result = await _audioPlayer.play(DeviceFileSource(audioFilePath!));
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
        _audioPlayer.onPlayerComplete.listen((event) {
          setState(() {
            isPlaying = false;
          });
        });
      }
    }
  }

  void _toggleAudio() {
    if (isPlaying) {
      _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _audioPlayer.resume();
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Markdown(
          data: widget.text,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          selectable: true,
          onTapLink: (text, href, title) => launchUrlString(text),
          padding: EdgeInsets.zero,
        ),
        IconButton(
          icon: Icon(isPlaying ? Icons.volume_up : Icons.volume_off),
          onPressed: _toggleAudio,
        ),
      ],
    );
  }
}