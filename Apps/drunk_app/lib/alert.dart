import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      appBar: AppBar(
        title:Text("Tô tão bem não, man"),
        backgroundColor: Colors.yellow[600],
        ),
      body: Center(
      child: Text("Me leva pro banheiro, por favor!", textAlign: TextAlign.center, 
        style: TextStyle(color: Colors.white, fontSize: 50.0),),
      )  
        );
  }
}