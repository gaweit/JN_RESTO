import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jnresto/src/bloc/ProdukBloc.dart';
import 'package:jnresto/src/model/ProdukModel.dart';
import 'package:jnresto/src/ui/widget/produk/ListProduk.dart';

import 'package:http/http.dart' as http;

class Produk extends StatefulWidget {
  String kategori;

  Produk({
    this.kategori,
  });

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyGridView(),
    );
  }
}

class Kategoridata {
  String id_produk, nama_produk, harga;
  Kategoridata({this.id_produk, this.nama_produk, this.harga});
  //constructure for class

  factory Kategoridata.fromJson(Map<String, dynamic> json) {
    return Kategoridata(
      id_produk: json['id_produk'],
      nama_produk: json['nama_produk'],
      harga: json['harga'],
    );
  }
}

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() {
    return _MyGridViewState();
  }
}

class _MyGridViewState extends State<MyGridView> {
  final String apiURL = 'http://127.0.0.1/order-2021-12/api/produk.php';
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

  List<Kategoridata> peoplelist; //list array variable for peoples

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
                                  child: Text(data.nama_produk,
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
