import 'package:delivery_flutter_app/src/categoria/categoria_module.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer/menu/item_hidden_menu.dart';

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
          name: "NewYork,USA Change",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.white,
          icon: Icon(Icons.location_on, color: Colors.redAccent,),
          hideAppBar: true,
        ),
        ProdutoModule(),
      ),
    );

    itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
           baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected: Colors.brown,
          selectedStyle: TextStyle(color:Colors.brown,),
          hideAppBar: true,          
          icon : Icon(Icons.home, color: Colors.white,)
        ),
        ProdutoModule(),
      ),
    );

    

     itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "My Orders",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.blueAccent,
          icon: Icon(Icons.list, color: Colors.indigoAccent,),
        ),
        CategoriaModule(),
      ),
    );
     itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Notifications",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.blueAccent,
          icon: Icon(Icons.notifications, color: Colors.green,),
        ),
        CategoriaModule(),
      ),
    );
     itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.blueAccent,
          icon: Icon(Icons.settings, color: Colors.blueAccent,),
        ),
        CategoriaModule(),
      ),
    );
     itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Logout",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.6) , fontSize: 16, fontWeight: FontWeight.w400),
          colorLineSelected:  Colors.blueAccent,
          selectedStyle: TextStyle(color: Colors.blueAccent),
          appBarColor: Colors.blueAccent,
          icon: Icon(Icons.developer_mode),
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
       title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Foodnow", style: TextStyle(color: Colors.white , fontSize: 50), textAlign: TextAlign.center,),
          ),
        ],
      ),
      backgroundColorMenu: Colors.black,
      backgroundColorAppBar: Colors.cyan,
      backgroundMenu: DecorationImage(
          image:
              ExactAssetImage('assets/vegan_food.jpg'),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.xor),
          fit: BoxFit.cover),
      screens: itens,
    ),
    );
  }
}