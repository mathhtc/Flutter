import 'package:drunk_app/Nice.dart';
import 'package:drunk_app/alert.dart';
import 'package:drunk_app/hospital.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DrunkApp()));
}

class DrunkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[100],
        title: Text("Drunk Helper", style: TextStyle(color: Colors.black),)
      ),
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Center(
          child: Text("Opções de Mensagem", style: TextStyle(color: Colors.black, fontSize: 25.0),),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
          child:ListView(
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(0.0),
               color: Colors.green,
               child: FittedBox(
                 fit: BoxFit.cover,
                 child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute (builder: (context) => Nice()));                      
                        },
                      child: Icon(Icons.trip_origin),
                    )
                ),  
              ), 
            Container(
             padding: EdgeInsets.all(0.0),
             color: Colors.yellow,
             child: FittedBox(
                fit: BoxFit.cover,
                child: FlatButton(
                    onPressed: ( ){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Alert()));
                    },
                    child: Icon(Icons.warning),
                    )
                ),  
              ),
            Container(
               padding: EdgeInsets.all(0.0),
               color: Colors.red,
               child: FittedBox(
                  fit: BoxFit.cover,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Hospital()));
                      },
                      child: Icon(Icons.add, color: Colors.white,),
                     )
                ),  
              ),
              ]),
          )
          ]
      ),
    ),
    );
  }
}