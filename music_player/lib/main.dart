import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'package:music_player/offline_music.dart';
import 'package:music_player/video_offline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Entertainment"), backgroundColor: Colors.pinkAccent),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 400,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.pinkAccent,
                width: 3,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(20),
                  child: GradientText("Hybrid Media Player",
                      gradient: LinearGradient(colors: [
                        Colors.pink.shade200,
                        Colors.pink.shade200,
                        Colors.pink.shade200,
                      ]),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(40),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.music_note,
                            size: 80,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Music(),
                                ));
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.video_label,
                            size: 80,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Video(),
                                ));
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Offline_Music(),
    );
  }
}

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Video_Player(),
    );
  }
}
