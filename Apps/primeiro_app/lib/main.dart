import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Quantidade de caba que enrabou Thiagão", 
    home: Home()
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int caboclos = 0;
  String sit = "Tá em ordem";

  void changeCaboclos(int s){
    setState(() {
    caboclos += s;
    if(caboclos > 4){
      sit = "Tá arrombado, hein Thiagão?";
    }
    else if(caboclos<4 && caboclos>=0){
      sit = "Tá safe, patrão!";
    }
    else if(caboclos<0){
      sit = "O cu do patrão nasceu de novo";
    }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("C:/Users/mathe/OneDrive/Documentos/FlutterApps/primeiro_app/.dart_tool/images/2020-01-25-01-28-08.png", 
        fit: BoxFit.fill,height: 1000,),
        Column(
           mainAxisAlignment: MainAxisAlignment.center, 
           children: <Widget>[

            Text( "Quantos caboclos comeram Thiagão?: $caboclos", style: TextStyle(backgroundColor: Colors.white,
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0,), textAlign: TextAlign.center,), 
            Row(
               mainAxisAlignment: MainAxisAlignment.center, 
               children: <Widget>[ 
                 Padding( 
                   padding: EdgeInsets.all(10.0), 
                   child: FlatButton( 
                     child: Text("+1", style: TextStyle(fontSize: 35.0, color: Colors.red, backgroundColor: Colors.white),),
                     onPressed: (){changeCaboclos(1); }, ) ),
                 Padding( 
                   padding: EdgeInsets.all(10.0), 
                   child: FlatButton( 
                     child: Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.green, backgroundColor: Colors.white),), 
                     onPressed: (){ changeCaboclos(-1);}, 
                     )
                    ), 
                  ], 
                ), 
          Text( sit, 
            style: TextStyle(color: Colors.purple, fontStyle: FontStyle.italic, fontSize: 32.0,
            backgroundColor: Colors.white), textAlign: TextAlign.center,) ], )
      ],
    );
  }
}