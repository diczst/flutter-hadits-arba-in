import 'package:flutter/material.dart';
import 'package:alquran/data/imamnawawi.dart';

class ImamNawawi extends StatefulWidget {
  @override
  _ImamNawawiState createState() => _ImamNawawiState();
}

class _ImamNawawiState extends State<ImamNawawi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0,
                    child: Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Biografi Imam An-Nawawi'),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Bio.tentang[0]['bio']),
                            ),
                            ExpansionTile(
                              title: Text('Kitab-kitab karya Imam An-Nawawi'),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, bottom: 8),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      Bio.tentang[0]['karya'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('Pendapat Para Ulama Terhadapnya'),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, bottom: 16),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      Bio.tentang[0]['pendapatulama'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0,
                    child: Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Biografi Imam Ibnu Daqiq Al-‘Ied'),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Bio.tentang[0]['bio2']),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
