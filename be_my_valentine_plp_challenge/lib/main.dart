import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be my Valentine PLP Challenge',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AssetsAudioPlayer assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudio();
  }

  void _playAudio() {
    assetAudioPlayer.open(Audio("assets/IluvU.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Background.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/HeartGif.json'),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'ITCEDSCR',
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText('Be my valentine',
                            speed: const Duration(milliseconds: 115))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () => _playAudio(),
          ),
        ),
      ),
    );
  }
}
