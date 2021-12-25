import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListProduk extends StatefulWidget {

  String nama_produk;
  String harga;
  String gambar;
  bool isFavorite;

  ListProduk ({
    this.nama_produk,
    this.harga,
    this.gambar,
    this.isFavorite,
  });

  @override
  _ListProdukState createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  final formatter = NumberFormat('#,###');

  var widgetAdd;
  int numQty = 1;
  int max;
  int min;
  bool add = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 5.0,
        left: 15.0,
        right:15.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0,),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height:120.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('http://10.0.2.2/jn_order/public/uploads/img/' + widget.gambar),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.isFavorite)
                        Icon(
                          Icons.favorite,
                          color: Colors.red[600],
                      )
                      else
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red[600],
                        )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height:7.0,
            ),
            Padding (
              padding: EdgeInsets.only(
                left: 6.0,
                right: 6.0,
              ),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Varela',
                    color: Colors.lightBlue[800],
                  ),
                  text: '${widget.nama_produk}',
                ),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              '${widget.harga}',
              style: TextStyle(
                fontFamily: 'Varela',
                color: Colors.lightBlue[800],
                fontSize: 14.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Color(0xFFEBEBEB),
                height: 1.0,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
