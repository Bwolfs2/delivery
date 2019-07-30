import 'package:delivery_flutter_app/src/produtos/models/categoria_model.dart';
import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:delivery_flutter_app/src/produtos/pages/add/add_produto_page.dart';
import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

import '../../produto_module.dart';
import 'home_produto_bloc.dart';

class HomeProdutoPage extends StatefulWidget {
  @override
  _HomeProdutoPageState createState() => _HomeProdutoPageState();
}

class _HomeProdutoPageState extends State<HomeProdutoPage> {
  var bloc = ProdutoModule.to.getBloc<HomeProdutoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<CategoriaModel>>(
                stream: bloc.categoriasJoin,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  return !snapshot.hasData
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            CategoriaModel categoria = snapshot.data[index];
                            return categoria.produtos != null &&
                                    categoria.produtos.isNotEmpty
                                ? ExpansionTile(
                                    title: Text(
                                      categoria.name ??
                                          "alguma coisa deu errado",
                                      style: TextStyle(
                                          color: categoria.produtos.length > 0
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    children: categoria?.produtos
                                        ?.map<Widget>(
                                          (produto) => ListTile(
                                            title: Text(produto.name ??
                                                "alguma coia deu errado"),
                                            subtitle: Text(
                                                produto.description ??
                                                    "alguma coisa deu errado"),
                                          ),
                                        )
                                        ?.toList(),
                                  )
                                : ListTile(
                                    title: Text(
                                        categoria.name ?? "algo deu errado"),
                                  );
                          },
                        );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: CircleFloatingButton.floatingActionButton(
          key: UniqueKey(),
            items: [
              FloatingActionButton(
                heroTag: UniqueKey().toString() ,
                key: UniqueKey(),
                backgroundColor: Colors.blueAccent,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddProdutoPage(),),),
                  // var added = await bloc.addProduto(
                  //   ProdutoModel(
                  //     name: "Coca-Cola",
                  //     description: "Refrigerante de Cola",
                  //     price: 10,
                  //     categoriaId: "je3uHZTFcclkQFivZvw2",
                  //     condiments: List.generate(
                  //       4,
                  //       (index) => CondimentModel(
                  //           name: "Name $index", quantity: index),
                  //     ),
                  //   ),
                  // );
                  // if (added) {
                  //   print("Addded");
                  // }
                
                tooltip: 'Add',
                child: Icon(Icons.add),
              ), //
              FloatingActionButton(
                key: UniqueKey(),
                heroTag: UniqueKey().toString() ,
                backgroundColor: Colors.orangeAccent,
                onPressed: () {},
                child: Icon(Icons.category),
                tooltip: 'Category',
              ),
              FloatingActionButton(
                key: UniqueKey(),
                heroTag: UniqueKey().toString() ,
                backgroundColor: Colors.redAccent,
                onPressed: () async {
                  var added = await bloc.addProduto(ProdutoModel(
                      name: "Fanta-Cola",
                      description: "Refrigerante de Laranja",
                      price: 10,
                      id: "f01cd490-3260-11e9-c6c4-a1124cd55f20"));
                  if (added) {
                    print("Addded");
                  }
                },
                child: Icon(Icons.remove),
                tooltip: 'Remove',
              ),
            ],
            color: Colors.tealAccent,
            icon: Icons.menu,
            duration: Duration(milliseconds: 500),
            curveAnim: Curves.ease));
  }
}
