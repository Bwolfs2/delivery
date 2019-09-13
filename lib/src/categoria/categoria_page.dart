import 'package:flutter/material.dart';

class CategoriaPage extends StatefulWidget {
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  double width = 0;
  var nome = false;
  var email = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(        
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (value) {
                setState(() {
                  if (value.length > 2 && !nome) {
                    width += 150;
                    nome = true;
                  } else {
                    if (nome && value.length <= 2) {
                      width -= 150;
                      nome = false;
                    }
                  }
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (value) {
                setState(() {
                  if (value.length > 2 && !email) {
                    width += 150;
                    email = true;
                  } else {
                    if (email && value.length <= 2) {
                      width -= 150;
                      email = false;
                    }
                  }
                });
              },
            ),
             SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: 60,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: width,
                        height: 60,
                        color: Color(0xff14ff65),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: width == 300 ? (){
                      print("Teste");
                    } : null,
                    child: Center(
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
