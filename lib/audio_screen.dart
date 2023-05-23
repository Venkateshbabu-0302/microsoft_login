import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioFile {
  final String title;
  final String url;

  AudioFile({required this.title, required this.url});
}

List<AudioFile> audioFiles = [
  AudioFile(
    title: 'Audio 1',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
  ),
  AudioFile(
    title: 'Audio 2',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
  ),
  // add more audio files as needed
];

class Audio_Screen extends StatefulWidget {
  const Audio_Screen({super.key});

  @override
  _Audio_ScreenState createState() => _Audio_ScreenState();
}

class _Audio_ScreenState extends State<Audio_Screen> {
  late AudioPlayer audioPlayer;
  AudioFile? currentAudioFile;
  late String audioTitle = '';

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio List'),
      ),
      body: ListView.builder(
        itemCount: audioFiles.length,
        itemBuilder: (context, index) {
          AudioFile audioFile = audioFiles[index];
          return ListTile(
            title: Text(audioFile.title),
            trailing: StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                if (playerState?.processingState == ProcessingState.buffering ||
                    playerState?.processingState == ProcessingState.loading && audioFile.title == audioTitle) {
                  return CircularProgressIndicator();
                } else if (playerState?.processingState ==
                    ProcessingState.completed) {
                  audioPlayer.seek(Duration.zero);
                  return Icon(Icons.replay);
                } else if (audioPlayer.playing &&
                    currentAudioFile?.url == audioFile.url) {
                  return IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: () async {
                      await audioPlayer.pause();
                      setState(() {});
                    },
                  );
                } else {
                  return IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () async {
                      setState(() {
                        audioTitle = '';
                      });
                      if(audioTitle ==  null || audioTitle != audioFile.title) {
                        setState(() {
                          audioTitle = audioFile.title;
                        });

                        if (currentAudioFile == null ||
                            currentAudioFile!.url != audioFile.url) {
                          await audioPlayer.setUrl(audioFile.url);
                          currentAudioFile = audioFile;
                        }
                      }
                      await audioPlayer.play();
                      setState(() {});
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}