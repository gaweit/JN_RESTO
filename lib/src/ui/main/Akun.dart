import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransfterData()),
                        );
                      },
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

class TransfterData extends StatefulWidget {
  TransfterDataWidget createState() => TransfterDataWidget();
}

class TransfterDataWidget extends State {
  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final notelpC = TextEditingController();

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  Future webCall() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String nama = nameController.text;
    String email = emailController.text;
    String notelp = notelpC.text;

    // API URL
    var url = 'https://jnresto.gaweit.com/api_jnresto/register.php';

    // Store all data with Param Name.
    var data = {'nama': nama, 'email': email, 'no_telp': notelp};

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Fill All Information in Form',
                      style: TextStyle(fontSize: 22))),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: nameController,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Name Here'),
                  )),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailController,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Email Here'),
                  )),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: notelpC,
                    autocorrect: true,
                    decoration:
                        InputDecoration(hintText: 'Enter Phone Number Here'),
                  )),
              RaisedButton(
                onPressed: webCall,
                color: Colors.pink,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text('Click Here To Submit Data To Server'),
              ),
              Visibility(
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator())),
            ],
          ),
        )));
  }
}
