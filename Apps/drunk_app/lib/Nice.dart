import 'package:flutter/material.dart';

class Nice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tô de boa, man!"),
        backgroundColor: Colors.green[500],
      ),
      backgroundColor: Colors.green[700],
      body: Center(
        child: Text("Tô bem, mano. Só deixa eu descansar", textAlign: TextAlign.center,
         style: TextStyle(color: Colors.white,fontSize: 50.0 ),)
      ),    
    );
  }
}