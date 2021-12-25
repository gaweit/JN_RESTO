import 'package:jnresto/src/model/ProdukModel.dart';
import 'package:jnresto/src/provider/ProdukProvider.dart';

class ProdukRepo {
  final _provider = ProdukProvider();

  Future <List<ProdukModel>> getProduk(String kategori){
    return _provider.getProduk(kategori);
  }
}