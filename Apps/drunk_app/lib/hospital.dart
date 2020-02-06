import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tô passando mal", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[800],
      body: Center(
        child: Text("Me leva pro hospital, não tá dando mais", textAlign: TextAlign.center,
         style: TextStyle(color: Colors.white, fontSize: 50.0),)
      )
    );
  }
}