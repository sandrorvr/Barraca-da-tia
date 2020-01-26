import 'package:barracadatia/TelaPraca.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset('imagens/logo.png'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                //controller: ,
                decoration: InputDecoration(
                  labelText: 'Seu nome meu sobrinho',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20)
              ),
              TextField(
                keyboardType: TextInputType.text,
                //controller: ,
                decoration: InputDecoration(
                  labelText: 'Sua senha meu sobrinho',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: (){},
                  child: Text('Esqueceu a senha/login?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: (){},
                  child: Text('Venha ser meu sobrinho também!',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text('Confirmar'),
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>TelaPraca()
                      )
                    );
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
