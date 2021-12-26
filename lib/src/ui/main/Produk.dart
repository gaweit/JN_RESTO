import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jnresto/src/bloc/ProdukBloc.dart';
import 'package:jnresto/src/model/ProdukModel.dart';
import 'package:jnresto/src/ui/widget/produk/ListProduk.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Produk extends StatefulWidget {
  String kategori;

  Produk({
    this.kategori,
  });

  @override
  _ProdukState createState() => _ProdukState();
}

class Kategoridata {
  int id_produk;
  String nama_produk;
  int harga;
  String kategori;
  String gambar;

  Kategoridata(
      {this.id_produk,
      this.nama_produk,
      this.harga,
      this.kategori,
      this.gambar});

  factory Kategoridata.fromJson(Map<String, dynamic> json) {
    return Kategoridata(
      id_produk: json['id_produk'],
      nama_produk: json['nama_produk'],
      harga: json['harga'],
      kategori: json['kategori'],
      gambar: "https://jnresto.gaweit.com/api_jnresto/image/" + json['gambar'],
    );
  }
}

class MainListView extends StatefulWidget {
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State {
  final String apiURL = 'https://jnresto.gaweit.com/api_jnresto/produk.php';
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
                            title: Text(data.nama_produk),
                            leading: Icon(Icons.label),
                            trailing: Text(data.kategori),
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
