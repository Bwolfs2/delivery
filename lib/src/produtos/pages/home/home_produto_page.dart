import 'package:delivery_flutter_app/src/produtos/models/categoria_model.dart';
import 'package:delivery_flutter_app/src/produtos/models/condiment_model.dart';
import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text("Produtos"),
        ),
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
                                          ?.map<Widget>((produto) => ListTile(
                                                title: Text(produto.name ??
                                                    "alguma coia deu errado"),
                                                subtitle: Text(produto
                                                        .description ??
                                                    "alguma coisa deu errado"),
                                              ))
                                          ?.toList(),
                                    )
                                  : ListTile(
                                      title: Text(
                                          categoria.name ?? "algo deu errado"));
                            });
                  }),
            ),
            Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                var added = await bloc.addProduto(
                  ProdutoModel(
                    name: "Coca-Cola",
                    description: "Refrigerante de Cola",
                    price: 10,
                    categoriaId: "je3uHZTFcclkQFivZvw2",
                    condiments: List.generate(
                      4,
                      (index) =>
                          CondimentModel(name: "Name $index", quantity: index),
                    ),
                  ),
                );
                if (added) {
                  print("Addded");
                }
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            ), //
            FloatingActionButton(
              onPressed: () async {
                var produto = await bloc.getProdutoById("f01bea30-3260-11e9-8fd9-3b9e5c2b8c8f");
                if (produto != null) {
                  print("${produto.name}");
                } else {
                  print("Not Found");
                }
              },
              tooltip: 'Remove',
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
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
              tooltip: 'Add',
              child: Icon(Icons.refresh),
            ),

            ///
          ],
        ));
  }
}
