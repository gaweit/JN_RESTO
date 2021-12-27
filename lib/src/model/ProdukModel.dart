//@dart=2.9
import 'dart:convert';

List<ProdukModel> produkFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<ProdukModel>.from(jsonData.map((x) => ProdukModel.fromJson(x)));
}

class ProdukModel {
  String id_produk;
  String nama_produk;
  String harga;
  String deskripsi;
  String gambar;
  String kategori;
  String status;

  ProdukModel(
      {this.id_produk,
      this.nama_produk,
      this.harga,
      this.deskripsi,
      this.gambar,
      this.kategori,
      this.status});

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
        id_produk: json['id_produk'],
        nama_produk: json['nama_produk'],
        harga: json['harga'],
        deskripsi: json['deskripsi'],
        gambar: json['gambar'],
        kategori: json['kategori'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id_produk': id_produk,
        'nama_produk': nama_produk,
        'harga': harga,
        'deskripsi': deskripsi,
        'gambar': gambar,
        'kategori': kategori,
        'status': status,
      };
}
