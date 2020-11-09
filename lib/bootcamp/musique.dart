


import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';


class MusicBoot extends StatefulWidget {
  @override
  _MusicBootState createState() => _MusicBootState();
}

class _MusicBootState extends State<MusicBoot> {

  Duration duration;
  Duration position;

  MusicFinder audioPlayer;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

   Future initAudioPlayer() async {
    audioPlayer = new MusicFinder();
    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print(e.toString());
    }

    print(songs);
    audioPlayer.setDurationHandler((d) => setState(() {
          duration = d;
        }));

    audioPlayer.setPositionHandler((p) => setState(() {
          position = p;
        }));

    audioPlayer.setCompletionHandler(() {
      onComplete();
      setState(() {
        position = duration;
      });
    });

    audioPlayer.setErrorHandler((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = new Duration(seconds: 0);
        position = new Duration(seconds: 0);
      });
    });

    setState(() {
      print(songs.toString());
    });
  }

   void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }


  @override
  void initState() {
    initAudioPlayer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

        ],
      ),
      
    );
  }
}

enum PlayerState{
  stopped,
  playing,
  paused
}