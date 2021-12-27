//@dart=2.9
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainListView(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Kategoridata {
  int id_pesanan;
  String nama;
  String tgl;
  int total_bayar;

  Kategoridata({this.id_pesanan, this.nama, this.tgl, this.total_bayar});

  factory Kategoridata.fromJson(Map<String, dynamic> json) {
    return Kategoridata(
      id_pesanan: json['id_pesanan'],
      nama: json['nama'],
      tgl: json['tgl'],
      total_bayar: json['total_bayar'],
    );
  }
}

class MainListView extends StatefulWidget {
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  //final String apiURL = 'http://localhost/order-2021-12/api_jnresto/kategori.php';
  var apiURL = 'https://jnresto.gaweit.com/api_jnresto/transaksi.php';
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
                          child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: ListTile(
                            title: Text(data.nama),
                            leading: Icon(Icons.label),
                            trailing: Text(data.tgl),
                          ),
                        ),
                      )),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}
