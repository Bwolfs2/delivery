import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Column(
          children: <Widget>[
            Text("Detalhe Legal"),
            Text("Detalhe Legal 1"),
            Text("Detalhe Legal 2"),
            Text("Detalhe Legal 3"),
            Text("Detalhe Legal 4"),
          ],
        ),
      ),
    );
  }
}
