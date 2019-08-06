import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:delivery_flutter_app/src/produtos/pages/add/add_produto_page.dart';
import 'package:delivery_flutter_app/src/produtos/pages/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../produto_module.dart';
import 'home_produto_bloc.dart';

class HomeProdutoPage extends StatefulWidget {
  @override
  _HomeProdutoPageState createState() => _HomeProdutoPageState();
}

class _HomeProdutoPageState extends State<HomeProdutoPage> {
  var bloc = ProdutoModule.to.getBloc<HomeProdutoBloc>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Produtos"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                searchController.text = "";
                bloc.refreshList();
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: searchController,
                  onChanged: bloc.searchAdd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search",
                    hintText: "search",
                    helperText: "ex:. coca-cola",
                  )),
            ),
            Expanded(
              child: StreamBuilder<List<ProdutoModel>>(
                stream: bloc.produtos,
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            ProdutoModel produto = snapshot.data[index];
                            return Card(
                              margin: EdgeInsets.all(5),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return DetailsPage();
                                  }));
                                },
                                leading: CircleAvatar(
                                  child: Text(produto.name
                                      .substring(0, 2)
                                      .toUpperCase()),
                                ),
                                title: Text(
                                  produto.name,
                                ),
                                subtitle: Text(produto.description),
                                trailing: Text(produto.price.toString()),
                              ),
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
                heroTag: UniqueKey().toString(),
                key: UniqueKey(),
                backgroundColor: Colors.blueAccent,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddProdutoPage(),
                  ),
                ),
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
                heroTag: UniqueKey().toString(),
                backgroundColor: Colors.orangeAccent,
                onPressed: () async {},
                child: Icon(Icons.category),
                tooltip: 'Category',
              ),
              FloatingActionButton(
                key: UniqueKey(),
                heroTag: UniqueKey().toString(),
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
