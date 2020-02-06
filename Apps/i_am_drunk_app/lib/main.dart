import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
   home: Scaffold(
      appBar: AppBar(
        title: Text("I Am Drunk", style: TextStyle(color: Colors.green[800])),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
       ),
      backgroundColor: Colors.amber,
      body: Center(
        child: Image.asset('lib/images/drunk.png'),
      ),
     )   
    )   
  );
}