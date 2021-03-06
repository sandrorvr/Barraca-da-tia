import 'package:flutter/material.dart';
import 'package:barracadatia/Dispositivos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TelaPraca extends StatefulWidget {
  @override
  _TelaPracaState createState() => _TelaPracaState();
}

class _TelaPracaState extends State<TelaPraca> {


  Future<List<Dispositivos>> RecuperarDados(url) async{
    http.Response response = await http.get(url);
    Map dados = json.decode(response.body);
    print(response.body);
    List<Dispositivos> lista = List();
    Dispositivos esp = Dispositivos(dados['Mesa'],dados['Produto'],dados['Quantidade'],dados['Status']);
    lista.add(esp);
    setState(() {
      ListaESP = lista;
    });
  }
  
  PostConfirmacao(url) async {

    var corpo = json.encode(
        {
          "resposta":"OK"
        }
    );

    http.Response response = await http.post(
      url + "/posts",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo
    );
    Navigator.of(context).pop();
  }

  Widget Icone(indice){
    if(ListaESP[indice].Status == "true"){
      return Icon(Icons.check_box);
    }else{
      return Icon(Icons.check_box_outline_blank);
    }
  }

  String url ='http://192.168.0.13';
  var clock;
  List<Dispositivos> ListaESP = [Dispositivos('','','','')];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('START'),
                  onPressed: (){
                    clock = Timer.periodic(Duration(milliseconds: 200), (timer) async{
                      List<Dispositivos> ListaESP = await RecuperarDados(url);
                    });
                  },
                ),
                RaisedButton(
                  child: Text('STOP'),
                  onPressed: (){
                    clock.cancel();
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, indice){
                  return ListTile(
                    leading: Icone(indice),
                    title: Text('Mesa: '+ListaESP[indice].Mesa),
                    subtitle: Text('Estado: '+ListaESP[indice].Status),
                    onTap: (){
                      return showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('MESA: '+ListaESP[indice].Mesa),
                            content: Text(
                              'PRODUTO: '+ListaESP[indice].Produto+'\n'+
                              'QUANTIDADE: '+ListaESP[indice].Quantidade
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: (){
                                  PostConfirmacao(url);
                                },
                              )
                            ],
                          );
                        }
                      );
                    },
                  );
                },
              )
            )
          ],
        ),
      )
    );
  }
}

