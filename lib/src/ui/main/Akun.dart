import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "Masukkan Username Anda"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration:
                      InputDecoration(hintText: "Masukkan Password Anda"),
                ),
                ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Login"),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Belum Punya Akun ?")],
                ),
                ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Registrasi"),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
