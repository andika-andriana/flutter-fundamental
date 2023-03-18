import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AudioPlayerExample(),
    );
  }
}

class AudioPlayerExample extends StatefulWidget {
  const AudioPlayerExample({super.key});

  @override
  State<AudioPlayerExample> createState() => _AudioPlayerExampleState();
}

class _AudioPlayerExampleState extends State<AudioPlayerExample> {
  String playerState = "Play Me";
  bool isPlaying = false;
  bool isStop = false;

  late AudioPlayer audioPlayer;

  _AudioPlayerExampleState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((res) {
      setState(() {
        playerState = res.toString();
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        isStop = true;
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  void onPlayAction() {
    if (isPlaying == false) {
      onPlay(
        UrlSource(
            'https://freetestdata.com/wp-content/uploads/2021/09/Free_Test_Data_100KB_MP3.mp3'),
      );
    } else {
      onPause();
    }
  }

  void onPlay(Source url) async {
    if (isPlaying == true) {
      await audioPlayer.resume();
    } else {
      await audioPlayer.play(url);
      setState(() {
        isPlaying = true;
        isStop = false;
      });
    }
  }

  void onPause() async {
    await audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void onStop() async {
    await audioPlayer.stop().then((res) {
      setState(() {
        isPlaying = false;
        isStop = true;
      });
    }).catchError((onError) {
      debugPrint("Error $onError");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Audio Player Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AudioActionButton(
                    activeColor: Colors.blue,
                    inActiveColor: Colors.grey,
                    iconData:
                        (isPlaying == false) ? Icons.play_arrow : Icons.pause,
                    onTap: () => onPlayAction(),
                    isActive: isPlaying,
                    isEnable: true,
                  ),
                  AudioActionButton(
                    activeColor: Colors.blue,
                    inActiveColor: Colors.grey,
                    iconData: Icons.stop,
                    onTap: () => onStop(),
                    isActive: !isStop,
                    isEnable: !isStop,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  playerState,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioActionButton extends StatefulWidget {
  final Color activeColor, inActiveColor;
  final IconData iconData;
  final Function onTap;
  final bool isActive;
  final bool isEnable;

  const AudioActionButton({
    super.key,
    required this.activeColor,
    required this.inActiveColor,
    required this.iconData,
    required this.onTap,
    required this.isActive,
    required this.isEnable,
  });

  @override
  State<AudioActionButton> createState() => _AudioActionButtonState();
}

class _AudioActionButtonState extends State<AudioActionButton> {
  bool isTaped = false;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (widget.isActive) ? pi / 4 : 0.0,
      child: GestureDetector(
        onTap: () {
          if (widget.isEnable) {
            widget.onTap();
            setState(() {
              isTaped = !isTaped;
            });
          }
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: (widget.isActive) ? 2 : 10,
          shadowColor:
              (widget.isActive) ? widget.activeColor : widget.inActiveColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: (widget.isActive || widget.isEnable)
                          ? widget.activeColor
                          : widget.inActiveColor,
                      child: Transform.rotate(
                        angle: (widget.isActive) ? -pi / 4 : 0.0,
                        child: Icon(
                          widget.iconData,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(30, 30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(30, -30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-30, -30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-30, 30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
