import 'package:flutter/material.dart';
import 'package:musicplayer/components/my_drawer.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:musicplayer/models/songs.dart';
import 'package:musicplayer/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void gotoSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(title: Text('P L A Y L I S T')),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get playlist
          final List<Song> playlist = value.playlist;
          //return last view ui
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get individual song
              final Song song = playlist[index];

              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.imagePath),
                onTap: () => gotoSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
