import 'package:delivery_flutter_app/src/categoria/categoria_module.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';

import 'produtos/produto_module.dart';


class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  //Navigator
  List<ScreenHiddenDrawer> itens = [];

@override
  void initState() {
    super.initState();
    //Navigators
    itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Produtos",
          baseStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          colorLineSelected: Colors.brown,
          selectedStyle: TextStyle(color:Colors.brown,),
        //  hideAppBar: true,
          menuIcon: Icons.home,
        ),
        ProdutoModule(),
      ),
    );

    itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Categorias",
          baseStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.blueAccent,
        ),
        CategoriaModule(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Delivery",
      theme: ThemeData(
        primaryColor: Color(0xff6EBA33),
        accentColor: Colors.amberAccent,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white , fontSize: 20)
          ),
          iconTheme: IconThemeData(
              color: Colors.white
          )
        )
      ),
      home: HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.cyan,
      backgroundMenu: DecorationImage(
          image:
              ExactAssetImage('assets/background_menu.jpg'),
          fit: BoxFit.cover),
      screens: itens,
    ),
    );
  }
}