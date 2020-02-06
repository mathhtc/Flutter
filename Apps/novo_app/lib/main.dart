import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("I am rich", textAlign: TextAlign.center),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Image.asset('lib/images/diamond.png')
      ) ,
    )
  ));
}
