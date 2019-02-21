import 'package:delivery_flutter_app/models/categoria.dart';
import 'package:delivery_flutter_app/models/produto.dart';
import 'package:delivery_flutter_app/services/produto_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ProdutoService service = ProdutoService();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Categoria>>(
                  stream: service.categoriasJoin,
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    return !snapshot.hasData
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Categoria categoria = snapshot.data[index];

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
                                          ?.toList())
                                  : ListTile(
                                      title: Text(
                                          categoria.name ?? "algo deu errado"));
                            });
                  }),
            ),
            // Expanded(
            //   child: StreamBuilder<List<Produto>>(
            //       stream: service.produtos,
            //       builder: (context, snapshot) {

            //         return !snapshot.hasData
            //             ? CircularProgressIndicator()
            //             : ListView.builder(
            //                 itemCount: snapshot.data.length,
            //                 itemBuilder: (BuildContext context, int index) =>
            //                     ListTile(
            //                       title: Text(snapshot.data[index].name ??
            //                           "alguma coisa"),
            //                       dense: true,
            //                     ),
            //               );
            //       }),
            // ),
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
                    '$_counter',
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
                var added = await service.addProduto(Produto(
                    name: "Coca-Cola",
                    description: "Refrigerante de Cola",
                    price: 10));
                if (added) {
                  print("Addded");
                }
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            ), //
            FloatingActionButton(
              onPressed: () async {
                var produto = await service
                    .getProdutoById("f01bea30-3260-11e9-8fd9-3b9e5c2b8c8f");
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
                var added = await service.addProduto(Produto(
                    name: "fata-Cola",
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
