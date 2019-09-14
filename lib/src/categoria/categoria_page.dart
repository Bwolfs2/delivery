import 'package:delivery_flutter_app/src/categoria/categoria_bloc.dart';
import 'package:delivery_flutter_app/src/categoria/categoria_module.dart';
import 'package:flutter/material.dart';

class CategoriaPage extends StatefulWidget {
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  CategoriaBloc bloc = CategoriaModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidate: true,
              decoration: InputDecoration(labelText: "Nome"),
              validator: (value) {
                if (value.length > 2) {
                  bloc.nomeController.add(true);
                  return null;
                } else {
                  bloc.nomeController.add(false);
                  return "O campo deve conter mais de 2 caracteres";
                }
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              autovalidate: true,
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value.length > 2) {
                  bloc.emailController.add(true);
                  return null;
                } else {
                  bloc.emailController.add(false);
                  return "O campo deve conter mais de 2 caracteres";
                }
              },
            ),
            SizedBox(
              height: 25,
            ),
            StreamBuilder<double>(
              stream: bloc.percent,
              initialData: 0,
              builder: (context, snapshot) {
                return Container(
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
                            width: snapshot?.data ?? 0,
                            height: 60,
                            color: Color(0xff14ff65),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (snapshot?.data ?? 0) == 300
                            ? () {
                                print("Teste");
                              }
                            : null,
                        child: Center(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
