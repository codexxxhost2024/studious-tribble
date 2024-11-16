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

import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionaryView extends StatefulWidget {
  const QuestionaryView({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<QuestionaryView> createState() => _QuestionaryViewState();
}

class _QuestionaryViewState extends State<QuestionaryView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _playAudio(); // Autoplay on initialization
  }

  void _playAudio() async {
    int result = await _audioPlayer.play('your_audio_url_here');
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  void _pauseAudio() async {
    int result = await _audioPlayer.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  void _toggleAudio() {
    if (isPlaying) {
      _pauseAudio();
    } else {
      _playAudio();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollLoopAutoScroll(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.volume_up : Icons.volume_off,
              color: Colors.black,
            ),
            onPressed: _toggleAudio,
          ),
        ),
      ],
    );
  }
}
