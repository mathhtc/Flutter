import 'package:flutter/material.dart';

void main() {

runApp(MaterialApp(
  home: Home()
  ,
));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String info = "Informe seus dados";
  GlobalKey<FormState> _formKey = GlobalKey();
  void resetFields(){
    setState(() {
    weightController.text = "";
    heightController.text = "";
    info = "Informe seus dados";
    _formKey = GlobalKey<FormState>();
    });
  }
    
  void calculo(){
    setState(() {
      
    double peso = double.parse(weightController.text);
    double altura = double.parse(heightController.text)/100;
    double imc = peso/(altura*altura);

    if(imc<18.6){
      info = "IMC: ${imc.toStringAsPrecision(4)}. Se passar uma brisa mais forte te carrega, visse?";
    }else if (imc >= 18.6 && imc<24.9){
      info = "IMC: ${imc.toStringAsPrecision(4)}. Tá no grau";  
    }else if(imc >= 24.9 && imc<29.9){
      info = "IMC: ${imc.toStringAsPrecision(4)}. Tô vendo um buchinho de cerveja aí, hein?";
    }else if(imc>=29.9 && imc<34.9){
      info = "IMC: ${imc.toStringAsPrecision(4)}. Situação tá feia, dieta e exercício";
    }else if(imc>34.99){
      info ="IMC ${imc.toStringAsPrecision(4)}. Tua situação tá feia não, tá a galega";
    }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC",),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh,),
            onPressed: (){  
              resetFields();
            }
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0,10.0 , 0.0),//margem nos 4 lados,
        child: 
        Form(
          key: _formKey,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,//Alinhamento dos widgets da coluna no eixo horizontal
            children: <Widget>[
              Icon(Icons.person, size: 125, color: Colors.green,),
              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(//Decoração do textField
                  labelText: "Peso (kg)",//texto acima do campo
                  labelStyle: TextStyle(color: Colors.green, fontSize: 23.0)//estilo do texto acima do campo
                ), 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 23.0), //Alinhamento e cor dos dados digitados
                controller: weightController,
                validator: (value){
                  if(value.isEmpty || double.parse(value) <= 0){
                    return "Insira um valor válido";
                  }
                },
              ),
              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura(cm)",//texto acima do campo
                  labelStyle: TextStyle(color: Colors.green,fontSize: 23.0)//Estilo do texto acima do campo
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 23.0), //Alinhamento e cor dos dados digitados
                controller: heightController,
                validator: (value){
                  if(value.isEmpty || double.parse(value) <= 0){
                    return "Insira um valor válido";
                  }
                },
              ),
              Padding(
               padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
               child:Container(
                  height: 45.0, //Pra alterar a "grossura" do botão. Coloca num container e altera o tamanho
                  child: RaisedButton(
                   onPressed: (){
                     if(_formKey.currentState.validate()){
                       calculo();
                     }
                     ;},
                   child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 22.5),),
                   color: Colors.green,
                )
              )
            ),
              Text(info, textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 22.5),
            )
        ],
      )
    )
  )
  );
  }
}