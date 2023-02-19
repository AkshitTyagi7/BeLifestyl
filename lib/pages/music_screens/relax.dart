import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Music extends StatefulWidget {
  String audioUrl = 'http://adornflow.com/songs/Starboy.mp3';

  Music({required this.audioUrl});

  @override
  _MusicState createState() => _MusicState(audioUrls: audioUrl);
}

class _MusicState extends State<Music> {
  String audioUrls;

  _MusicState({required this.audioUrls});
  final audioPlayer = AudioPlayer();
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
  bool isPlaying=false;
  @override
  void initState(){
  
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      print(PlayerState.PLAYING);
      setState(() {
      isPlaying=state==PlayerState.PLAYING;});
      print(isPlaying);
    });
        audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration=newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position=newPosition;
      });
     });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(201),
                  child: Image.network(
                    'https://adornflow.com/songs/gym.jpg',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 32),
              const Text(
                'The Flutter Song',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ), // TextStyle
              ), // Text
              const SizedBox(height: 4),
              const Text(
                'Sarah Abs',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position=Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration - position))
                    ]), // Row
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ), // Icon
                  iconSize: 50,
                  onPressed: () async {
                    print('Hellow World');
                    print(isPlaying);
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                       String url =audioUrls;
                      await audioPlayer.play(url);
                    }
                  },
                ), // IconButton
              ), // CircleAvatar
            ],
          ), // Column
        ), // Padding
      ); // Scaffold
}
