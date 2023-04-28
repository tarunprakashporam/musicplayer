import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/sources/PlayingScreen.dart';

class Song {
  final String title;
  final String artist;
  final String album;

  Song({required this.title, required this.artist, required this.album});
}

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<Song> songs = [
    Song(title: 'Shape of you ', artist: 'Ed sheeran', album: 'Divide'),
    Song(title: 'Despacito', artist: 'some from greek ', album: 'only greek'),
    Song(title: 'kunmugulu', artist: 'tarun prakash', album: 'tarun kertanalu'),
    Song(title: 'Naa Madhi', artist:'tarun prakash', album: 'thiru')
  ];

  Set<Song> playlist = {};

  void _addToPlaylist(Song song) {
    setState(() {
      playlist.add(song);
    });
  }

  void _navigateToPlaylist() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Playlist(playlist: playlist.toList())),
    );
  }

  void _navigateToPlayingScreen(Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayingScreen(song: song)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIBRARY'),
        actions: [
          IconButton(
            icon: Icon(Icons.queue_music),
            onPressed: _navigateToPlaylist,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(songs[index].title),
            subtitle: Text('${songs[index].artist} - ${songs[index].album}'),
            onTap: () => _navigateToPlayingScreen(songs[index]),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addToPlaylist(songs[index]),
            ),
          );
        },
      ),
    );
  }
}

class PlayingScreen extends StatefulWidget {
  final Song song;

  PlayingScreen({Key? key, required this.song}) : super(key: key);

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.song.title),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  final List<Song> playlist;

  const Playlist({Key? key, required this.playlist}) : super(key: key);

  void _navigateToPlayingScreen(BuildContext context, Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayingScreen(song: song)),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(playlist[index].title),
            subtitle: Text('${playlist[index].artist} - ${playlist[index].album}'),
            onTap: () => _navigateToPlayingScreen(context, playlist[index]),
          );
        },
      ),
    );
  }
}