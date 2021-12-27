//@dart=2.9
import 'package:http/http.dart' show Client;
import 'package:jnresto/src/model/ProdukModel.dart';
import 'package:flutter/foundation.dart' show compute;

class ProdukProvider {
  Client _client = Client();

  Future<List<ProdukModel>> getProduk(String kategori) async {
    var uri = Uri.parse('http://10.0.2.2/jn_order/api/produk');

    uri = uri.replace(queryParameters: <String, String>{
      'kategori': kategori,
    });

    final res = await _client.get(uri, headers: {
      'Accept': 'application/json',
    });

    if (res.statusCode == 200) {
      return compute(produkFromJson, res.body);
    } else {
      return [];
    }
  }
}
