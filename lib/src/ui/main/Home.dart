import 'package:flutter/material.dart';
import 'package:jnresto/src/bloc/ProdukBloc.dart';
import 'package:jnresto/src/ui/main/Produk.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String kategori = 'all';

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    produkBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    produkBloc.getProduk(kategori);
    return Scaffold(
        appBar: AppBar(
          textTheme: TextTheme(),
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          elevation: 0.0,
          title: Text(
            'JN Resto',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Varela',
            ),
            textAlign: TextAlign.start,
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.lightBlue[800],
            isScrollable: true,
            labelPadding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            unselectedLabelColor: Color(0xFFCDCDCD),
            onTap: _getTabs,
            tabs: [
              Tab(
                child: Text(
                  'Semua',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Appertizer',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Nasi',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Dessert',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Produk(
              kategori: 'all',
            ),
            Produk(
              kategori: 'appertizer',
            ),
            Produk(
              kategori: 'nasi',
            ),
            Produk(
              kategori: 'dessert',
            ),
          ],
        ));
  }

  _getTabs(int value) {
    if (value == 0) {
      setState(() {
        kategori = 'all';
      });
    } else if (value == 1) {
      setState(() {
        kategori = 'appertizer';
      });
    } else if (value == 2) {
      setState(() {
        kategori = 'nasi';
      });
    } else if (value == 3) {
      setState(() {
        kategori = 'dessert';
      });
    }
  }
}
