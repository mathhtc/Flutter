import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';


void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> lastRemoved;
  int lastRemovedPos;
  final listController = TextEditingController();
  List toDoList = List();

 @override
  void initState(){
    super.initState();
    readData().then((data){
      setState(() {
      toDoList = json.decode(data);  
      });
      
    });
  }
  void addToList(){
    setState(() {
      Map<String, dynamic> newToDO = Map();//lista de mapas criada
      newToDO ["title"] = listController.text; //setando a key "title"
      listController.text = "";
      newToDO["ok"] = false; //setando o value "ok"
      toDoList.add(newToDO); //adicionando um mapa a lista de mapas
      saveData();
  });
  }

  Future<Null> refresh() async{
    await Future.delayed(Duration(seconds: 1));

    
    setState(() {
    toDoList.sort((a , b){
      if(a["ok"] && !b["ok"]) return 1;
      else if(!a["ok"] && b["ok"]) return -1;
      else return 0;
    });
    saveData();  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: //lembrar de colocar dentro de um Text 
          Text("Lista de Tarefas", style: TextStyle(color:Colors.black, ),),
          backgroundColor: Colors.orange[900],
          centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 10.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(child:
                  TextField(
                    controller: listController,
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder()
                    ),
                  )
                ),
                SizedBox( //cara, bagulho bom pra  mudar o tamanho das coisas, sério msm
                  height: 58.0,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text("ADD"),
                    onPressed: addToList,
                ))
              ],
            ),
          ),
        Expanded(
          child: RefreshIndicator(onRefresh: refresh,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0), //espaçamento dos widgets do topo
            itemCount: toDoList.length,  
            itemBuilder: buildItem,   
          ),
          )
        )
        ],
      ),
    );
  }
  Future<File> getPath() async{
    final directory = await getApplicationDocumentsDirectory(); //Pega o diretório onde os dados podem ser guardados
    ///porém o comando não é executado de imediato, por isso o await
    return File("${directory.path}/data.json"); //percebeu o que rolou? Tu pegou o caminho, seja ele qual for
    ///e tacou num json pra abrir como árvore os ngçs
    ///ow negão, se pá que esse comando cria um arquivo tb se não tiver um já
}

  Future<File> saveData() async{
    String data = json.encode(toDoList); //transforma a lista em json
    final file = await getPath(); //pega o caminho do arquivo
    return file.writeAsString(data); //taca o dado no arquivo
}
  Future<String> readData() async{
    try{
      final file = await getPath();
      return file.readAsString();
    }
    catch (e){
      return null;
    }
  }
  Widget buildItem(context, index){
    return  Dismissible(
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color:Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child:  CheckboxListTile(
         title: Text(toDoList[index]["title"]),
         value: toDoList[index]["ok"],
         secondary: CircleAvatar(
          child: Icon(toDoList[index]["ok"] ? 
                Icons.check : Icons.error),              
               ),
         onChanged: (s){
                setState(() {
                    toDoList[index]["ok"] = s;   
                  });         
                  },
              ),
      onDismissed: (direction){
        setState(() {
          lastRemoved = Map.from(toDoList[index]);
          lastRemovedPos = index;
          toDoList.removeAt(index);

        saveData();
        
        final snack = SnackBar(
        content: Text("Tarefa ${lastRemoved["title"]} removida"),
        action: SnackBarAction(
          label: "Desfazer",
          onPressed: (){
            setState(() {
               toDoList.insert(lastRemovedPos, lastRemoved);
               saveData();
            });},
        ),
        duration: Duration(seconds: 5),
        );
      Scaffold.of(context).showSnackBar(snack);
        });
        },
    );
}
}

