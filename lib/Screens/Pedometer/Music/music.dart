import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {


  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {


  final _player = AudioPlayer();

  @override
  void initState() {


    super.initState();
    _player.setFilePath('assets/audio/sample.mp3');
  }

  @override
  void dispose() {


    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {


                _player.play();
              },
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                _player.pause();
              },
            ),
          ],
        ),
      ),
    );
  }
}
