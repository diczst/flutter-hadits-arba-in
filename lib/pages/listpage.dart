import 'package:flutter/material.dart';
import 'detailpage.dart';
import 'package:alquran/data/haditss.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  static AudioPlayer advancedPlayer = new AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hadits'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal :24.0),
            child: Icon((Icons.list), 
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: Haditss.listHaditss.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            child: Container(
              height: 77,
              child: ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DetailHadits(
                            judulbar: Haditss.listHaditss[index]['urutanindo'],
                            judul: Haditss.listHaditss[index]['urutanarab'],
                            hadits: Haditss.listHaditss[index]['hadits'],
                            riwayat: Haditss.listHaditss[index]['riwayat'],
                            terjemahan: Haditss.listHaditss[index]['terjemahan'],
                            pelajaran: Haditss.listHaditss[index]['pelajaran'],
                            audio: Haditss.listHaditss[index]['audio'],
                          ),
                    )),
                leading: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Text(
                    Haditss.listHaditss[index]["no"],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(Haditss.listHaditss[index]["urutanarab"]),
                subtitle: Text(Haditss.listHaditss[index]["urutanindo"]),
              ),
            ),
          );
        },
      ),
    );
  }
}