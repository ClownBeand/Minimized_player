import 'package:flutter/material.dart';
import 'package:musicplayer/components/my_drawer.dart';
import 'package:musicplayer/components/neu_box.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitalSecond =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:${twoDigitalSecond}";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      //get playlist
      final playlist = value.playlist;
      //get currentSong
      final currentSong = playlist[value.currentSongIndex ?? 0];
      // or currentSongIndex

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Text('P L A Y L I S T'),
                    IconButton(
                        onPressed: () {
                          MyDrawer();
                        },
                        icon: const Icon(Icons.menu)),
                  ],
                ),
                // album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(currentSong.imagePath),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                            const Icon(Icons.favorite),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                // song duration progress
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(formatTime(value.currentDuration)),

                          // shuffle icon
                          const Icon(Icons.shuffle),

                          // start time
                          const Icon(Icons.repeat),

                          // end time
                          Text(formatTime(value.totalDuration)),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {},
                        onChangeEnd: (double double) {
                          value.seek(Duration(seconds: double.toInt()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // playback controls
                // 24:14
                Row(
                  children: [
                    //skip previous
                    Expanded(
                      child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child:
                              const NeuBox(child: Icon(Icons.skip_previous))),
                    ),
                    SizedBox(width: 20),
                    // play pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NeuBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          )),
                    ),
                    SizedBox(width: 20),
                    // skip forward
                    Expanded(
                      child: GestureDetector(
                          onTap: value.playNextSong,
                          child: const NeuBox(child: Icon(Icons.skip_next))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
