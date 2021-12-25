import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Kategori extends StatefulWidget {
  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainListView(),
      ),
    );
  }
}

class Kategoridata {
  int id_kategori;
  String nama_kategori;
  int status;

  Kategoridata({this.id_kategori, this.nama_kategori, this.status});

  factory Kategoridata.fromJson(Map<String, dynamic> json) {
    return Kategoridata(
      id_kategori: json['id_kategori'],
      nama_kategori: json['nama_kategori'],
      status: json['status'],
    );
  }
}

class MainListView extends StatefulWidget {
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  final String apiURL = 'http://127.0.0.1/order-2021-12/api/kategori.php';

  Future<List<Kategoridata>> fetchStudents() async {
    var response = await http.get(apiURL);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Kategoridata> studentList = items.map<Kategoridata>((json) {
        return Kategoridata.fromJson(json);
      }).toList();

      return studentList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Kategoridata>>(
      future: fetchStudents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map((data) => Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                  child: Text(data.nama_kategori,
                                      style: TextStyle(fontSize: 21),
                                      textAlign: TextAlign.left))
                            ]),
                      ),
                      Divider(color: Colors.black),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}
