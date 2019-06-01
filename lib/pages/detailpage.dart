import 'package:flutter/material.dart';
import 'dart:async';
import 'package:alquran/data/haditss.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailHadits extends StatefulWidget {
  DetailHadits(
      {this.judulbar,
      this.judul,
      this.hadits,
      this.riwayat,
      this.terjemahan,
      this.pelajaran,
      this.audio});

  final String judulbar;
  final String judul;
  final String hadits;
  final String riwayat;
  final String terjemahan;
  final String pelajaran;
  final String audio;

  @override
  _DetailHaditsState createState() => _DetailHaditsState();
}

class _DetailHaditsState extends State<DetailHadits> {
  double heightBar = 0;
  int index =0;

  AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  static AudioPlayer advancedPlayer = new AudioPlayer();
  String localFilePath;
  IconData iconData = Icons.play_circle_outline;
  IconData iconSound = Icons.volume_up;

  //icon changed statement

  void iconChangedPause() {
    setState(() {
      iconData = Icons.pause_circle_outline;
    });
  }

  void iconChangedPlay() {
    setState(() {
      iconData = Icons.play_circle_outline;
    });
  }

  void iconChangedSoundOff() {
    setState(() {
      iconSound = Icons.volume_off;
    });
  }

  void iconChangedSoundPlay() {
    setState(() {
      iconSound = Icons.volume_up;
    });
  }

  void playBarAppear() {
    setState(() {
      heightBar = 60;
    });
  }

  void playBarDisappear() {
    setState(() {
      heightBar = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judulbar,style: TextStyle(fontSize: 16)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(iconSound),
              onPressed: () {
                if (iconSound == Icons.volume_up) {
                  playBarAppear();
                  iconChangedSoundOff();
                  audioCache.play(widget.audio);
                  iconChangedPause();
                } else if (iconSound == Icons.volume_off) {
                  playBarDisappear();
                  iconChangedSoundPlay();
                  advancedPlayer.stop();
                }
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.judul,
                    style: TextStyle(fontSize: 30, fontFamily: 'QuranulKalam'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.hadits,
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 28, fontFamily: 'QuranulKalam'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  leading: Icon(Icons.people),
                  title: Text('Riwayat'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        widget.riwayat,
                        style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CardExpand(
            judulExpand: "Terjemahan Hadits",
            isiExpand: widget.terjemahan,
            iconExpand: Icons.translate,
          ),
          CardExpand(
            judulExpand: "Syarah Hadits",
            isiExpand: widget.pelajaran,
            iconExpand: Icons.school,
          )
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        curve: Curves.easeOutCirc,
        duration: Duration(seconds: 1),
        height: heightBar,
        color: Colors.blue[400],
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 200,
                child: IconButton(
                  icon: Icon(
                    iconData,
                    color: Colors.white,
                    size: 45,
                  ),
                  onPressed: () {
                    if (iconData == Icons.play_circle_outline) {
                      audioCache.play(widget.audio);
                      iconChangedPause();
                    } else if (iconData == Icons.pause_circle_outline) {
                      advancedPlayer.pause();
                      iconChangedPlay();
                    }
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
                onPressed: () {
                  advancedPlayer.stop();
                  iconChangedPlay();
                  playBarDisappear();
                  iconChangedSoundPlay();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardExpand extends StatelessWidget {
  CardExpand({this.judulExpand, this.isiExpand, this.iconExpand});

  final String judulExpand;
  final String isiExpand;
  final IconData iconExpand;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(iconExpand),
            title: Text(judulExpand),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    isiExpand,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
