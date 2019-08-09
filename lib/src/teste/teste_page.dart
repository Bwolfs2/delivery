import 'package:delivery_flutter_app/src/teste/teste_bloc.dart';
import 'package:delivery_flutter_app/src/teste/teste_module.dart';
import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  var bloc = TesteModule.to.getBloc<TesteBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestePage"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: bloc.control01,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Valor 01: "),
          ),
          TextField(
            controller: bloc.control02,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Valor 02: "),
          ),
          TextField(
            controller: bloc.control03,
            decoration: InputDecoration(labelText: "Total: "),
          ),
        ],
      ),
    );
  }
}
