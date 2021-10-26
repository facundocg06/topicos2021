import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SumaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sumar',
      home: Suma(),
    );
  }
}

class Suma extends StatefulWidget {
  State<StatefulWidget> createState() => Sumar();
}

class Sumar extends State<Suma> {
  final s1 = TextEditingController();
  final s2 = TextEditingController();
  String resultado = "";
  void sumados() {
    int numero1 = int.parse(s1.text);
    int numero2 = int.parse(s2.text);
    int res = numero1 + numero2;
    setState(() {
      resultado = "La suma es: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sumar'),
        backgroundColor: Color(0xFFf01DFD7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Form(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 115,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: s1,
                            decoration: InputDecoration(
                              hintText: "",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(),
                        Container(
                          width: 115,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: s2,
                            decoration: InputDecoration(
                              hintText: "",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: sumados,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blueGrey,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Text('Sumar')],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    child: Center(
                      child: Text(
                        resultado,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
