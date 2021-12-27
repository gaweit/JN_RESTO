//@dart=2.9
import 'package:jnresto/src/model/ProdukModel.dart';
import 'package:jnresto/src/repository/ProdukRepo.dart';
import 'package:rxdart/rxdart.dart';

class ProdukBloc {
  final _produkRepo = ProdukRepo();

  final _getAllProduk = PublishSubject<List<ProdukModel>>();

  Stream<List<ProdukModel>> get countProduk => _getAllProduk.stream;

  getProduk(String kategori) async {
    List<ProdukModel> produk = await _produkRepo.getProduk(kategori);
    _getAllProduk.sink.add(produk);
  }

  dispose() async {
    await _getAllProduk.drain();
    _getAllProduk.close();
  }
}

final produkBloc = ProdukBloc();
